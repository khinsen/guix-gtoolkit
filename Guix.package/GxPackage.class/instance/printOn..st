accessing
printOn: aStream
	super printOn: aStream.
	aStream << $(;
		<< name;
		<< $@;
		<< version;
		<< $)