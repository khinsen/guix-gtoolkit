printing
gtDisplayOn: aStream
	aStream
		<< 'Environment builder for ';
		<< environment printString;
		<< ', status: ';
		<< status asString.