printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(;
		<< file fullName;
		<< $).