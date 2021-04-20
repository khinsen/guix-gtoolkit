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
             ((ice-9 match)   #:select (match))
             ((ice-9 format)  #:select (format)))

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
  (define name-and-version
    (format #f "~a@~a"
            (package-name package)
            (package-version package)))
  (if (null? (find-packages-by-name
               (package-name package)
               (package-version package)))
      (list ''package-data (list->vector (full-package-data package)))
      (list ''package name-and-version)))

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
'