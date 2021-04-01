obsolete
initializeChannelsWithoutRepl
	| channelData channelNames |
	channelData :=  NeoJSONReader fromString:
		(self executeCommand: #('describe' '-f' 'json')).
	channelNames := channelData collect: [ :each |
		(each at: #name) asSymbol ].
	channels := OrderedDictionary new.
	channelNames sorted do: [ :each | channels at: each put: nil ].
	channelData do: [ :each |
		channels
			at: (each at: #name) asSymbol
			put: (GxChannel new
					name: (each at: #name) asSymbol;
					url: (each at: #url);
					commit: (each at: #commit);
					yourself) ]