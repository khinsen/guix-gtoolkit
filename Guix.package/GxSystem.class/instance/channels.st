accessing
channels
	| channelData |
	channelData :=  NeoJSONReader fromString:
		(self executeCommand: #('describe' '-f' 'json')).
	^ channelData collect: [ :each |
		GxChannel new
			name: (each at: #name);
			url: (each at: #url);
			commit: (each at: #commit);
			yourself ]