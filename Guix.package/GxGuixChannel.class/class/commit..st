instance creation
commit: aString
	^ self new
		name: #guix;
		url: self gitUrl;
		commit: aString;
		yourself