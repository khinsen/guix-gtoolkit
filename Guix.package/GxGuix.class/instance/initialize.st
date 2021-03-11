initialization
initialize
	self replProcessPort: 9978.
	self startRepl.
	self initializeChannels.
	self initializePackagesV2.