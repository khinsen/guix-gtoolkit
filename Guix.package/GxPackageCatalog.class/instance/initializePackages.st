initialization
initializePackages
	| jsonFile objectInfo numberOfObjects |
	jsonFile := self packageInfoFile.
	jsonFile isFile ifFalse: [ self buildObjectInfo ].
	objectInfo := (NeoJSONReader on: jsonFile readStream) next.
	numberOfObjects := objectInfo size.
	guixObjects := objectInfo collect: [ :each |
		GxObject fromJson: each catalog: self ].
	packagesBySpecification := Dictionary new.
	guixObjects select: [ :each | each isPackage and: [ each isHidden not] ] thenDo: [ :each |
		packagesBySpecification at: each specification
			ifPresent: [ self error: 'Duplicate package ', each specification ]
			ifAbsentPut: [ each ] ].
	packages := GxPackageGroup new packages: (guixObjects select: #isPackage).