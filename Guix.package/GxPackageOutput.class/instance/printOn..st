printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self specification.
	aStream nextPut: $).