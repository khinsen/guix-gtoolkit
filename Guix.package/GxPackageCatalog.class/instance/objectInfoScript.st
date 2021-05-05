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
 (guix download)
 (guix git-download)
 (guix hg-download)
 (guix svn-download)
 (guix cvs-download)
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

(define (package-info package source inputs findable?)
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
      (source . ,source)
      (inputs . ,inputs))))

(define (download-proc->symbol proc)
  (cond
   ((memq proc (list url-fetch
                      url-fetch/tarbomb
                      url-fetch/zipbomb
                      url-fetch/executable))
    ''url)
   ((eq? proc cvs-fetch) ''cvs)
   ((eq? proc svn-fetch) ''svn)
   ((eq? proc svn-multi-fetch) ''svn-multi)
   ((eq? proc git-fetch) ''git)
   ((eq? proc hg-fetch) ''hg)
   (else ''other)))

(define (url-origin-info origin)
  (let* ((uri (origin-uri origin))
         (url (cond
               ((string? uri) uri)
               ((list? uri) (car uri))
               (else (format #t "Strange URI: ~s\n" uri)))))
    `((url . ,url))))

(define (git-origin-info origin)
  (let ((ref (origin-uri origin)))
    `((url . ,(git-reference-url ref))
      (commit . ,(git-reference-commit ref)))))

(define (hg-origin-info origin)
  (let ((ref (origin-uri origin)))
    `((url . ,(hg-reference-url ref))
      (changeset . ,(hg-reference-changeset ref)))))

(define (svn-origin-info origin)
  (let ((ref (origin-uri origin)))
    `((url . ,(svn-reference-url ref))
      (revision . ,(svn-reference-revision ref)))))

(define (svn-multi-origin-info origin)
  (let ((ref (origin-uri origin)))
    `((url . ,(svn-multi-reference-url ref))
      (revision . ,(svn-multi-reference-revision ref))
      (locations . ,(list->vector (svn-multi-reference-locations ref))))))

(define (cvs-origin-info origin)
  (let ((ref (origin-uri origin)))
    `((root-directory . ,(with-exception-handler (lambda (exc) "")
                           (lambda () (cvs-reference-root-directory ref))
                           #:unwind? #t))
      (module . ,(with-exception-handler (lambda (exc) "")
                   (lambda () (cvs-reference-module ref))
                   #:unwind? #t))
      (revision . ,(cvs-reference-revision ref)))))

(define (unknown-origin-info origin)
  (let ((method (origin-method origin))
        (uri (origin-uri origin)))
    `((method-details . ,(format #f "~s" method))
      (uri . ,(format #f "~s" uri)))))

(define (origin-info origin)
  (let* ((method (download-proc->symbol (origin-method origin)))
         (specifics
          (cond
           ((eq? method ''url) (url-origin-info origin))
           ((eq? method ''git) (git-origin-info origin))
           ((eq? method ''hg) (hg-origin-info origin))
           ((eq? method ''svn) (svn-origin-info origin))
           ((eq? method ''svn-multi) (svn-multi-origin-info origin))
           ((eq? method ''cvs) (cvs-origin-info origin))
           ((eq? method ''other) (unknown-origin-info origin))
           (else #f))))
    (append
     `((type . origin)
       (method . ,method)
       (filename . ,(origin-actual-file-name origin)))
     specifics)))

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
      (hash-set! input->index input current-input-index))
    (hash-ref input->index input))
  (define indices ''())
  (for-each (match-lambda
              ((_ (? package? p) _ ...)
               (set! indices (cons (hash-ref input->index p) indices)))
              ((_ (? origin? o) _ ...)
               (set! indices (cons (add-input o) indices))
               (set! reverse-input-list (cons (origin-info o) reverse-input-list))
               (set! current-input-index (+ 1 current-input-index)))
              ((_ (? string? s) _ ...)
               (set! indices (cons (add-input s) indices))
               (set! reverse-input-list (cons (file-info s) reverse-input-list))
               (set! current-input-index (+ 1 current-input-index)))
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
                     (let* ((inputs (package-input-indices p))
                            (source (hash-ref input->index (package-source p))))
                       (package-info p
                                     source
                                     inputs
                                     (< i available-package-count))))
                   index->package)
       (reverse-list->vector reverse-input-list)))))
  #:encoding "UTF-8")
'