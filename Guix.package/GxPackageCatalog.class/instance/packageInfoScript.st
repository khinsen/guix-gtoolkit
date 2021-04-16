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

(define (package-info specification)
  (let*
      ((package (specification->package specification))
       (location (package-location package))
       (license-field (package-license package))
       (licenses (if (license? license-field)
		     (list license-field)
		     license-field)))
    `((name . ,(package-name package))
      (version . ,(package-version package))
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
      (fold-available-packages
       (lambda* (name version result
		      #:key outputs location
		      supported? deprecated?
		      #:allow-other-keys)
         (if (and supported? (not deprecated?))
	     (cons (package-info (format #f "~a@~a" name version))
	           result)
	     result))
       ''()))))
  #:encoding "UTF-8")
'