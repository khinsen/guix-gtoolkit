accessing
currentChannels
	| channelData channelNames channels |
	channelData :=  NeoJSONReader fromString:
		(self executeCommand: #('describe' '-f' 'json')).
	^ channelData collect: [ :each |
		GxChannel new
			name: (each at: #name) asSymbol;
			url: (each at: #url);
			commit: (each at: #commit);
			yourself ]