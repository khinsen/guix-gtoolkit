accessing
lookup: aString
	^ packagesBySpecification at: aString
		ifAbsent: [
			| nameAndVersion |
			nameAndVersion := '@' split: aString.
			 GxPackage new
			 	name: nameAndVersion first;
			 	version: nameAndVersion second ]