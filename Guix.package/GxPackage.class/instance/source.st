accessing
source
	^ self inputs first collect: [ :eachIndex | catalog objectAt: eachIndex ]