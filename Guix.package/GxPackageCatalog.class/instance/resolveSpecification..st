operating
resolveSpecification: aString
	| packageAndOutput package output nameAndVersion name version |
	packageAndOutput := ':' split: aString.
	package := packageAndOutput first.
	output := packageAndOutput at: 2 ifAbsent: nil.
	packagesByName at: package ifAbsent: [
		nameAndVersion := '@' split: package.
		name := nameAndVersion first.
		version := nameAndVersion at: 2 ifAbsent: nil.
		package := guix findBestMatchingPackage: name version: version ].
	package := packagesByName at: package.
	^ output
		ifNil: [ package ]
		ifNotNil: [ package outputNamed: output asSymbol ]