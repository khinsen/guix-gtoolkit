accessing
directInputs
	^ self inputs second collect: [ :eachIndex | catalog objectAt: eachIndex ]