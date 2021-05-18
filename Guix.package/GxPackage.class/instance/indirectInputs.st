accessing
indirectInputs
	^ (self buildInputs copyWithoutAll: self source)
		copyWithoutAll: self directInputs.