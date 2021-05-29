printing
gtDisplayOn: aStream
	aStream
		<< 'Environment builder for ';
		<< environment name;
		<< ', status: ';
		<< status asString.