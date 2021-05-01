accessing
buildInputs
	^ self inputs second collect: [ :eachIndex | catalog objectAt: eachIndex ]