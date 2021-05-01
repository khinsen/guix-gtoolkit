accessing
directInputs
	^ self inputs first collect: [ :eachIndex | catalog objectAt: eachIndex ]