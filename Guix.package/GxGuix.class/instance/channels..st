accessing
channels: aGxChannels
	channels := aGxChannels.
	self startRepl.
	self startWorker.
	events := OrderedCollection new.