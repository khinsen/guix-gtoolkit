printing
printOn: aStream
	aStream
		<< self class name;
		<< $(;
		<< link fullName;
		<< ' -> ';
		<< file fullName;
		<< $).