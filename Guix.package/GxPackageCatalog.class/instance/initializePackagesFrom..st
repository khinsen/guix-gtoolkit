initialization
initializePackagesFrom: jsonFile
	| objectInfo numberOfObjects |
	objectInfo := (NeoJSONReader on: jsonFile readStream) next.
	numberOfObjects := objectInfo size.
	guixObjects := objectInfo collect: [ :each |
		GxObject fromJson: each catalog: self ].
	packages := GxPackageGroup new packages: (guixObjects select: #isPackage).
	packagesByName := Dictionary new.
	guixObjects
		select: [ :each | each isPackage and: [ each isHidden not] ]
		thenDo: [ :each |
			packagesByName at: each name
				ifPresent: [ :list | list add: each ]
				ifAbsentPut: [ OrderedCollection with: each ] ].
	packagesByName keysAndValuesDo: [ :name :list |
		list sort: [ :a :b | (a version gxCompareNumerically: b version) >= 2 ] ]