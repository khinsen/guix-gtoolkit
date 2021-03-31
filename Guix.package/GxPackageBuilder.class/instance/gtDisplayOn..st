printing
gtDisplayOn: aStream
	aStream
		<< 'Package builder for ';
		<< package specification;
		<< ', status: ';
		<< status asString.