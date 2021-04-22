comparing
= otherChannels
	self species = otherChannels species ifFalse: [ ^ false ].
	^ channelHash = otherChannels channelHash