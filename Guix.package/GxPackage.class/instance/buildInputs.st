accessing
buildInputs
	^ self inputs third collect: [ :eachIndex | catalog objectAt: eachIndex ]