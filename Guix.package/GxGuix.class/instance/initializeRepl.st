REPL
initializeRepl
	"Definitions that will be used regularly."
	self runReplCommand:
		'(use-modules (gnu packages)
             (guix packages)
             (guix derivations)
             (guix store)
             (guix utils)
             ((ice-9 match)   #:select (match))
             ((ice-9 format)  #:select (format)))'.
	self runReplCommand:
        '(define (store-paths specification)
           (let* ((package (specification->package specification))
                  (drv (with-store store
                                   (package-derivation store package #:graft? #f)))
                  (paths (derivation->output-paths drv)))
             (list->vector
              (map (lambda (entry)
                     (cons (string->symbol (car entry)) (cdr entry)))
                   paths))))'.
	self runReplCommand:
		'(define (input->specification input)
			(match input
				((label (? package? package) . _)
				 (list ''package
				 	(format #f "~a@~a"
						(package-name package)
						(package-version package))))
				((label (? origin? origin))
				 (list ''source (format #f "~a" (origin-uri origin))))
				(other-input
				 (list ''input (format #f "~a" other-input)))))'.
	self runReplCommand:
		'(define (inputs specification)
			(let* ((package (specification->package specification))
				   (direct-inputs (package-direct-inputs package))
				   (build-inputs (bag-direct-inputs (package->bag package))))
				(vector
					(map input->specification direct-inputs)
					(map input->specification build-inputs))))'.