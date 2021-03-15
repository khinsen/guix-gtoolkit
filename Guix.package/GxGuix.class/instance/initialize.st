initialization
initialize
	self replProcessPort: 9977.
	self startRepl.
	self initializeChannelsV2.
	self initializePackagesV4.