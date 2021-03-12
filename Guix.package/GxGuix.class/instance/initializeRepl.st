REPL
initializeRepl
	self runReplCommand:
		'(use-modules
			(gnu packages)
            (guix packages)
            (guix licenses)
            (guix utils))'.
	self runReplCommand:
		'(define (name+version->package name version)
			(specification->package
				(format #f "~a@~a" name version)))'.