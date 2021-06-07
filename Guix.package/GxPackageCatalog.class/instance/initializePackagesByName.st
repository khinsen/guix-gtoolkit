initialization
initializePackagesByName
	packagesByName := Dictionary new.
	packages packages 
		select: [ :each | each isHidden not ]
		thenDo: [ :each |
			packagesByName at: each name
				ifPresent: [ :list | list add: each ]
				ifAbsentPut: [ OrderedCollection with: each ] ].
	packagesByName keysAndValuesDo: [ :name :list |
		list sort: [ :a :b | (a version gxCompareNumerically: b version) >= 2 ] ]