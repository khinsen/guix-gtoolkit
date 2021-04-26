REPL
replCode
^'
(use-modules (gnu packages)
             (guix packages)
             (guix derivations)
             (guix store)
             (guix utils)
             (guix channels)
             (guix describe)
             (guix licenses)
             (srfi srfi-11)
             ((ice-9 match)   #:select (match))
             ((ice-9 format)  #:select (format)))

(define (package->specification package)
  (format #f "~a@~a"
          (package-name package)
          (package-version package)))

(define (shortest-unique-specification package)
  (let ((full-specification (package->specification package))
        (matches (map package->specification
                      (find-packages-by-name (package-name package)))))
    (if (null? matches)
        #f
        (let loop ((m matches)
                   (l (string-length (package-name package))))
          (cond
           ((equal? (car m) full-specification)
            (substring full-specification 0 l))
           ((null? (cdr m))
            #f)
           (else
            (loop (cdr m)
                  (+ 1 (string-compare (car m) (cadr m)
                                       (lambda (n) n)
                                       (lambda (n) n)
                                       (lambda (n) n))))))))))

(define (find-best-matching-package name version)
  (let ((matches (find-packages-by-name name version)))
    (cond
     ((null? matches) #f)
     (else (package->specification (car matches))))))

(define (package-store-paths package)
  (let* ((drv (with-store store
                          (package-derivation store package #:graft? #f)))
         (paths (derivation->output-paths drv)))
    (list->vector
     (map (lambda (entry)
            (cons (string->symbol (car entry)) (cdr entry)))
          paths))))

(define (store-paths specification)
  (package-store-paths (specification->package specification)))

(define (full-package-data package)
  (let*
      ((location (package-location package))
       (license-field (package-license package))
       (licenses (if (license? license-field)
		     (list license-field)
		     license-field)))
    `((name . ,(package-name package))
      (version . ,(package-version package))
      (shortest-specification . ,(shortest-unique-specification package))
      (hidden . ,(->bool (hidden-package? package)))
      (deprecated . ,(->bool (package-superseded package)))
      (outputs . ,(list->vector (package-outputs package)))
      (store-paths . ,(package-store-paths package))
      (channels . ,(list->vector (map channel-name (package-channels package))))
      (location . ,(list->vector
                    `((file . ,(search-path %load-path (location-file location)))
                      (line . ,(location-line location))
                      (column . ,(location-column location)))))
      (synopsis . ,(package-synopsis package))
      (description . ,(package-description package))
      (licenses . ,(list->vector (map license-name licenses)))
      (home-page . ,(package-home-page package)))))

(define (minimal-package-specification package)
  (if (null? (find-packages-by-name
               (package-name package)
               (package-version package)))
      (list ''package-data (list->vector (full-package-data package)))
      (list ''package (package->specification package))))

(define (input->specification input)
  (match input
    ((label (? package? package) . _)
     (minimal-package-specification package))
    ((label (? origin? origin))
     (list ''source (format #f "~a" (origin-uri origin))))
    (other-input
     (list ''input (format #f "~a" other-input)))))

(define (inputs specification)
  (let* ((package (specification->package specification))
         (direct-inputs (package-direct-inputs package))
         (build-inputs (bag-direct-inputs (package->bag package))))
    (list
     (list->vector (map input->specification direct-inputs))
     (list->vector (map input->specification build-inputs)))))

(define (find-package-output specification)
  (let-values (((package output)
                (specification->package+output specification)))
    (and package
         (format #f "~a@~a:~a"
                 (package-name package)
                 (package-version package)
                 output))))
'