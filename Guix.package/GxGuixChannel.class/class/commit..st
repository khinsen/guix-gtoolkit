instance creation
commit: aString
	^ self new
		name: #guix;
		url: 'https://git.savannah.gnu.org/git/guix.git';
		commit: aString;
		yourself