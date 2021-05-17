initialization
channels: aGxChannels
	| jsonFile |
	channels := aGxChannels.
	guix := GxGuix for: channels.
	jsonFile := self packageInfoFile.
	jsonFile isFile ifFalse: [ self buildObjectInfo ].
	self initializePackagesFrom: jsonFile