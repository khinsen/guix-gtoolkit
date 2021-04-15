inspecting
pillarDescription
	^ String streamContents: [ :stream |
		stream
			<< '""Name:"" '; << package name; << ':'; << output; cr;
			<< '""Version:"" '; << package version; cr.
		package channels size = 1
			ifTrue: [ stream << '""Channel:"" '; << package channels first name ]
			ifFalse: [
				stream << '""Channels:"" ';
					<< (', ' join: (package channels collect: #name)) ].
		stream
			cr; cr;
			<< package synopsis; cr;
			cr;
			<< (package description copyReplaceAll: Character cr asString with: ' '); cr;
			cr.
		package homePage ifNotNil: [
			stream
				<< '""Home page:"" *'; 
				<< package homePage;
				<< '>';
				<< package homePage;
				<< '*'; cr; cr ].
		stream
			<< '""License(s):"" ';
			<< (', ' join: package licenses) ]