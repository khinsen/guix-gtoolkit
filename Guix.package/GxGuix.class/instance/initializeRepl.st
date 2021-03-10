REPL
initializeRepl
	self replCommand:
		'(use-modules
			(gnu packages)
            (guix packages)
            (guix licenses)
            (guix utils))'.
	self replCommand:
		'(define (name+version->package name version)
			(specification->package
				(format #f "~a@~a" name version)))'.