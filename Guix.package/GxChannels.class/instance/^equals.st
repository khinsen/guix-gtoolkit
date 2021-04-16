comparing
= otherChannels
	self species = otherChannels species ifFalse: [ ^ false ].
	^ channels = otherChannels channels