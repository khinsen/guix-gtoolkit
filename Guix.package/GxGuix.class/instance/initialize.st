initialization
initialize
	self replProcessPort: 9876.
	self startRepl.
	self initializeChannels.
	self initializePackages.