accessing
packageInfoScript
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

(define (package-info package)
  (let*
      ((location (package-location package))
       (license-field (package-license package))
       (licenses (if (license? license-field)
		     (list license-field)
		     license-field)))
    `((name . ,(package-name package))
      (version . ,(package-version package))
      (shortest-specification . ,(shortest-specification package))
      (hidden . ,(->bool (hidden-package? package)))
      (deprecated . ,(->bool (package-superseded package)))
      (outputs . ,(list->vector (package-outputs package)))
      (channels . ,(list->vector (map channel-name (package-channels package))))
      (location . ((file . ,(search-path %load-path (location-file location)))
                   (line . ,(location-line location))
                   (column . ,(location-column location))))
      (synopsis . ,(package-synopsis package))
      (description . ,(package-description package))
      (licenses . ,(list->vector (map license-name licenses)))
      (home-page . ,(package-home-page package)))))

(define (package-data->json specification)
  (let* ((data (package-info specification)))
    (scm->json data)))

(with-output-to-file (cadr (command-line))
  (lambda ()
    (scm->json
     (list->vector
      (fold-packages
       (lambda (package result)
	 (cons (package-info package)
	       result))
       ''()
       #:select? supported-package?))))
  #:encoding "UTF-8")
'