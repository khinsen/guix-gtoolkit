initialization
initialize
	packages := SortedCollection new.
	packages sortBlock: [ :a :b | a name <= b name ].