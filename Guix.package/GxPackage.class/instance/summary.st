accessing
summary
	^ String streamContents: [ :stream |
		stream
			nextPutAll: self specification;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: self synopsis;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: self description;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: self homePage;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'License(s): ';
			nextPutAll: (', ' join: self licenses);
			yourself ]