initialization
initializePackages
	| jsonFile packageInfo numberOfPackages |
	jsonFile := self packageInfoFile.
	jsonFile isFile ifFalse: [ self buildPackageInfo ].
	packageInfo := (NeoJSONReader on: jsonFile readStream) next.
	numberOfPackages := packageInfo size.
	packages := Array new: numberOfPackages.
	packagesBySpecification := Dictionary new.
	numberOfPackages to: 1 by: -1 do: [ :index |
		| package |
		package := GxPackage new guix: guix; packageData: (packageInfo at: numberOfPackages - index + 1).
		packages at: index put: package.
		(package isHidden or: [ package isDeprecated ]) ifFalse: [
			packagesBySpecification at: package specification
				ifPresent: [ self error: 'Duplicate package ', package specification ]
				ifAbsentPut: [ package ] ] ].
	packages := GxPackageGroup new packages: packages.