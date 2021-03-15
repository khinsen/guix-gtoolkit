initialization
initializeChannelsV1
	| channelData |
	channelData :=  NeoJSONReader fromString:
		(self executeCommand: #('describe' '-f' 'json')).
	channels := channelData collect: [ :each |
		GxChannel new
			name: (each at: #name);
			url: (each at: #url);
			commit: (each at: #commit);
			yourself ]