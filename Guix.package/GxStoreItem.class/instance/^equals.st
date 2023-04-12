comparing
= other
	^ (other isKindOf: self class)
		and: [ self file = other file ]