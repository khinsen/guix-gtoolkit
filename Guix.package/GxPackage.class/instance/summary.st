accessing
summary
	^ String streamContents: [ :stream |
		stream
			nextPutAll: self specification;
			cr; cr;
			nextPutAll: self synopsis;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: self description;
			nextPut: Character cr;
			nextPut: Character cr.
		self homePage ifNotNil: [
			stream nextPutAll: self homePage; cr; cr ].
		stream
			nextPutAll: 'License(s): ';
			nextPutAll: (', ' join: self licenses);
			yourself ]