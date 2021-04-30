instance creation
fromJson: aDictionary forGuix: aGxGuix
	| objectType |
	objectType := aDictionary at: #type.
	self allSubclasses do: [ :each |
		each objectType = objectType ifTrue:  [
			^ each new
				guix: aGxGuix;
				fromJson: aDictionary ] ].
	self error: 'No subclass for object type ', objectType