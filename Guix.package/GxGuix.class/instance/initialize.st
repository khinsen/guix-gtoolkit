initialization
initialize
	self initializeWorker.
	self initializeChannels.
	self startRepl.
	self initializePackgesFromJSON.
	events := OrderedCollection new.