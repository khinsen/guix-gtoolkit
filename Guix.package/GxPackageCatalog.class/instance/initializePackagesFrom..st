initialization
initializePackagesFrom: jsonFile
	| objectInfo numberOfObjects |
	objectInfo := (NeoJSONReader on: jsonFile readStream) next.
	numberOfObjects := objectInfo size.
	guixObjects := objectInfo collect: [ :each |
		GxObject fromJson: each catalog: self ].
	packagesBySpecification := Dictionary new.
	guixObjects select: [ :each | each isPackage and: [ each isHidden not] ] thenDo: [ :each |
		packagesBySpecification at: each specification
			"ifPresent: [ self error: 'Duplicate package ', each specification ]"
			"Don't check for duplicates because there is one, for mysterious reasons:"
			"there are two packages texlive-amsfonts@51265"
			ifAbsentPut: [ each ] ].
	packages := GxPackageGroup new packages: (guixObjects select: #isPackage).