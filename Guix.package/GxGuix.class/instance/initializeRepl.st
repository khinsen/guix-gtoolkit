REPL
initializeRepl
	"Definitions that will be used regularly."
	self runReplCommand:
		'(use-modules (gnu packages)
             (guix packages)
             (guix derivations)
             (guix store)
             (guix utils))'.
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