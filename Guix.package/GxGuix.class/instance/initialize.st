initialization
initialize
	self initializeWorker.
	self replProcessPort: 9977.
	self startRepl.
	self initializeChannels.
	self initializePackages.