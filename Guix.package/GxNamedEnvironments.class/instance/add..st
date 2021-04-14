accessing
add: aGxEnvironment
	| name |
	name := aGxEnvironment name.
	self assert: name isNotNil.
	self assert: (environments includesKey: name) not.
	environments at: name put: aGxEnvironment