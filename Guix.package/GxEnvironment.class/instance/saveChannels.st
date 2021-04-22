persistence
saveChannels
	self isPersistent ifTrue: [
		self channelFile
			writeStreamDo: [ :s |
				channels writeChannelsTo: s ] ]