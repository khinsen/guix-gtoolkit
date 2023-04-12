testing
asRootItem
	(self referrers asArray = { self })
		ifFalse: [ ^ nil ].
	^ GxStore new rootFor: self file