initialization
initializePackagesV4
	| numberOfPackages |
	self runReplCommand:
		'(use-modules
			(gnu packages)
            (guix packages)
            (guix licenses)
            (guix utils))'.
	self runReplCommand:
		'(define available-packages
			(fold-available-packages
				(lambda* (name version result
							#:key outputs location
							supported? deprecated?
							#:allow-other-keys)
					(if (and supported? (not deprecated?))
						(cons (format #f "~a@~a" name version)
							result)
						result))
				''()))'.
	self runReplCommand:
		'(define (get-data-for-package package-specification)
			(let*
					((package (specification->package package-specification))
					(location (package-location package))
					(license-field (package-license package))
					(licenses (if (license? license-field)
								(list license-field)
								license-field)))
				`((name . ,(package-name package))
				(version . ,(package-version package))
				(outputs . ,(list->vector (package-outputs package)))
				(location . ,(list->vector
								`((file . ,(location-file location))
                                  (line . ,(location-line location))
                                  (column . ,(location-column location)))))
				(synopsis . ,(package-synopsis package))
				(description . ,(package-description package))
				(licenses . ,(list->vector (map license-name licenses)))
				(home-page . ,(package-home-page package)))))'.
	self runReplCommand:
		'(define (get-data-for-next-package)
			(let ((data (get-data-for-package (car available-packages))))
				(set! available-packages (cdr available-packages))
			data))'.
	numberOfPackages := self runReplCommandAndParse: 
		'(length available-packages)'.
	packages := OrderedCollection new.
	numberOfPackages to: 1 by: -1 do: [ :index |
		| packageData |
		packageData := self runReplCommandAndParse:
			'(get-data-for-next-package)'.
		packages at: index put:
			(GxPackage fromPackageData: packageData) ].
	self
		assert: (self runReplCommandAndParse: '(length available-packages)')
		equals: 0.