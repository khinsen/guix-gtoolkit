accessing
recursiveDependents
	^ recursiveDependents ifNil: [
		recursiveDependents := self dependents copy.
		self dependents do: [ :each |
			recursiveDependents := recursiveDependents union: each recursiveDependents ].
		recursiveDependents ]