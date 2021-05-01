initialization
objectInfoScript
^'
(use-modules
 (gnu packages)
 (guix describe)
 (guix channels)
 (guix packages)
 (guix derivations)
 (guix store)
 (guix licenses)
 (guix utils)
 ((ice-9 match))
 (srfi srfi-1)
 (srfi srfi-43)
 (json))

(define (package->specification package)
  (format #f "~a@~a"
          (package-name package)
          (package-version package)))

(define (shortest-specification package)
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

(define (package-info package inputs findable?)
  (let*
      ((location (package-location package))
       (license-field (package-license package))
       (licenses (cond
                  ((license? license-field) (list license-field))
                  ((list? license-field) license-field)
		  (else ''()))))
    `((type . package)
      (name . ,(package-name package))
      (version . ,(package-version package))
      (shortest-specification . ,(and findable?
                                      (not (hidden-package? package))
                                      (shortest-specification package)))
      (outputs . ,(list->vector (package-outputs package)))
      (channels . ,(list->vector (map channel-name (package-channels package))))
      (location . ((file . ,(search-path %load-path (location-file location)))
                   (line . ,(location-line location))
                   (column . ,(location-column location))))
      (synopsis . ,(package-synopsis package))
      (description . ,(package-description package))
      (licenses . ,(list->vector (map license-name licenses)))
      (home-page . ,(package-home-page package))
      (inputs . , inputs))))

(define (origin-info origin)
  `((type . origin)
    (uri . ,(format #f "~a" (origin-uri origin)))))

(define (file-info filename)
  `((type . file)
    (filename . ,filename)))

(define available-packages
  (fold-packages
   (lambda (package result)
     (cons package result))
   ''()
   #:select? (lambda (p) (and (supported-package? p)
                              (not (hidden-package? p))
                              (not (package-superseded p))))))
(define available-package-count (length available-packages))
(define index->package
  (list->vector
    (delete-duplicates
     (append available-packages
             (package-closure available-packages)))))

(define input->index (make-hash-table 40000))
(vector-for-each (lambda (i p)
                   (hash-set! input->index p i))
                 index->package)

(define current-input-index (vector-length index->package))
(define reverse-input-list ''())

(define (inputs->indices inputs)
  (define (add-input input)
    (unless (hash-ref input->index input)
      (hash-set! input->index input current-input-index)
      (set! reverse-input-list (cons input reverse-input-list))
      (set! current-input-index (+ 1 current-input-index)))
    (hash-ref input->index input))
  (define indices ''())
  (for-each (match-lambda
              ((_ (? package? p) _ ...)
               (set! indices (cons (hash-ref input->index p) indices)))
              ((_ (? origin? o) _ ...)
               (set! indices (cons (add-input (origin-info o)) indices)))
              ((_ (? string? s) _ ...)
               (set! indices (cons (add-input (file-info s)) indices)))
              (_ #f))
            inputs)
  (list->vector indices))

(define (package-input-indices package)
  (vector
   (inputs->indices (package-direct-inputs package))
   (inputs->indices (bag-direct-inputs (package->bag package)))))

(with-output-to-file (cadr (command-line))
  (lambda ()
    (scm->json
     (vector-concatenate
      (list
       (vector-map (lambda (i p)
                     (package-info p
                                   (package-input-indices p)
                                   (< i available-package-count)))
                   index->package)
       (reverse-list->vector reverse-input-list)))))
  #:encoding "UTF-8")
'