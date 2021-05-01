instance creation
fromJson: aDictionary catalog: aGxPackageCatalog
	| objectType |
	objectType := aDictionary at: #type.
	self allSubclasses do: [ :each |
		each objectType = objectType ifTrue:  [
			^ each new
				catalog: aGxPackageCatalog;
				fromJson: aDictionary ] ].
	self error: 'No subclass for object type ', objectType