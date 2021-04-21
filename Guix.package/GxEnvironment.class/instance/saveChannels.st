persistence
saveChannels
	directory ifNotNil: [
		directory / 'channels.scm'
			writeStreamDo: [ :s |
				channels writeSchemeDefinitionTo: s ] ]