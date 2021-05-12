initialization
objectInfoScript
^'
 (use-modules
 (gnu packages)
 (guix describe)
 (guix channels)
 (guix packages)
 (guix build-system)
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
 ((ice-9 vlist))
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
      (inputs . ,inputs)
      (build-system . ,(build-system-name (package-build-system package))))))

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

(define (object-closure packages)

  (define (add-leaf-dependencies leaves input->index index)
    (let loop ((leaves leaves)
               (input->index input->index)
               (index index))
      (match leaves
        (()
         (list input->index index))
        ((leaf . rest)
         (if (vhash-assoc leaf input->index)
             (loop rest input->index index)
             (loop rest 
                   (vhash-cons leaf index input->index)
                   (+ 1 index)))))))

  (define extract-input
    (match-lambda
      ((? package? package)
       package)
      ((label (? package? package) . _)
       package)
      ((? origin? origin)
       (origin-info origin))
      ((label (? origin? origin) . _)
       (origin-info origin))
      ((? string? string)
       (file-info string))
      ((label (? string? string) . _)
       (file-info string))
      (_ #f)))
  
  (define input->index
    (let loop ((packages packages)
               (input->index vlist-null)
               (index 0))
      (match packages
        (()
         input->index)
        ((package . rest)
         (if (vhash-assoc package input->index)
             (loop rest input->index index)
             (match-let*
                 ((bag            (package->bag package))
                  (dependencies   (filter-map extract-input
                                              (bag-direct-inputs bag)))
                  (p-dependencies (filter package? dependencies))
                  (l-dependencies (filter (negate package?) dependencies))
                  ((input->index.next index.next)
                   (add-leaf-dependencies l-dependencies input->index index)))
               (loop (append p-dependencies rest)
                     (vhash-cons package index.next input->index.next)
                     (+ 1 index.next))))))))

  (define (package-input-indices package)
    (define (i->i input)
      (and=> (vhash-assoc input input->index)
             cdr))
    (list->vector
     (map (lambda (is)
            (list->vector (filter-map i->i (filter-map extract-input is))))
          (list (list (package-source package))
                (package-direct-inputs package)
                (bag-direct-inputs (package->bag package))))))

  (let ((objects (make-vector (vlist-length input->index))))
    (vlist-for-each
     (match-lambda
       ((object . index)
        (vector-set! objects index
                     (if (package? object)
                         (package-info object
                                       (package-input-indices object)
                                       (->bool (memq object available-packages)))
                         object))))
     input->index)
    objects))

(define objects (object-closure available-packages))

(with-output-to-file (cadr (command-line))
  (lambda () (scm->json objects))
  #:encoding "UTF-8")
'