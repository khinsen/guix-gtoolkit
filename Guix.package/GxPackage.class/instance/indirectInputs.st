accessing
indirectInputs
	| indirect |
	indirect := self buildInputs copyWithoutAll: self directInputs.
	^ indirect copyWithout: self source