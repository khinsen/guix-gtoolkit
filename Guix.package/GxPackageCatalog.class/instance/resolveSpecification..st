operating
resolveSpecification: aString
	| packageAndOutput package output nameAndVersion name version |
	packageAndOutput := ':' split: aString.
	nameAndVersion := '@' split: packageAndOutput first.
	output := packageAndOutput at: 2 ifAbsent: nil.
	name := nameAndVersion first.
	version := nameAndVersion at: 2 ifAbsent: nil.
	packagesByName at: name
		ifPresent: [ :list |
			package :=
				version
					ifNil: [ list first ]
					ifNotNil: [ list detect: [ :eachPackage |
						(eachPackage version beginsWith: version) ]
							ifNone: [ nil ] ] ]
		ifAbsent: [ self error: 'No package named ', name ].
	package ifNil:
		[ self error: 'No version ', version, ' of package ', name ].
	^ output
		ifNil: [ package ]
		ifNotNil: [ package outputNamed: output asSymbol ]