accessing
pillarDescription
	^ String streamContents: [ :stream |
		stream
			<< '""Name:"" '; << name; cr;
			<< '""Version:"" '; << version; cr;
			cr;
			<< synopsis; cr;
			cr;
			<< (description copyReplaceAll: Character cr asString with: ' '); cr;
			cr.
		homePage ifNotNil: [
			stream
				<< '""Home page:"" *'; 
				<< homePage;
				<< '>';
				<< homePage;
				<< '*'; cr; cr ].
		stream
			<< '""License(s):"" ';
			<< (', ' join: self licenses) ]