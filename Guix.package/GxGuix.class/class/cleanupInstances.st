cleanup
cleanupInstances
	"This method is meant for use during development. It ensures that obsolete
	instances are no longer reused."
	self allInstancesDo: #invalidate.