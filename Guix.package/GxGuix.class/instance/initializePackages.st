initialization
initializePackages
	| packageData |
	packageData := self replCommand:
		'(fold-available-packages
			(lambda* (name version result
						#:key outputs location
						supported? deprecated?
						#:allow-other-keys)
				(cons `((name . ,name)
						(version . ,version))
						result))
			''())'.
 	packages := packageData