instance creation
current
	| channelData |
	channelData :=  NeoJSONReader fromString:
		(GxGuix executeCommand: #('describe' '-f' 'json')) first.
	^ self fromJson: channelData