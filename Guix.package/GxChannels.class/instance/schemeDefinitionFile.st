persistence
schemeDefinitionFile
	| reference |
	reference := GxGuix cacheDirectory / (self channelHash hex, '-channels.scm').
	reference isFile ifFalse: [
		reference writeStreamDo: [ :s | self writeSchemeDefinitionTo: s ] ].
	^ reference