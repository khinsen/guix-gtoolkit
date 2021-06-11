accessing
markdownDescription
	^ String streamContents: [ :stream |
		stream
			<< '**Name:** '; << name; cr;
			<< '**Version:** '; << version; cr.
		channels size = 1
			ifTrue: [ stream << '**Channel:** '; << channels first name ]
			ifFalse: [
				stream << '**Channels:** ';
					<< (', ' join: (channels collect: #name)) ].
		stream
			cr; cr;
			<< synopsis; cr;
			cr;
			<< (description copyReplaceAll: Character cr asString with: ' '); cr;
			cr.
		homePage ifNotNil: [
			stream
				<< '**Home page:** ['; 
				<< homePage;
				<< '](';
				<< homePage;
				<< ')'; cr; cr ].
		stream
			<< '**License(s):** ';
			<< (', ' join: self licenses) ]