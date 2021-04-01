initialization
initialize
	self initializeWorker.
	self replProcessPort: 9977.
	self startRepl.
	self initializeChannelsWithoutRepl.
	self initializePackgesFromJSON.
	"self initializePackages."