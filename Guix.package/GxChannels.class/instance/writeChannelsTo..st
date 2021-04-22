persistence
writeChannelsTo: aStream
	aStream << '(list'; lf.
	channels do: [ :each | each writeChannelTo: aStream. aStream lf ].
	aStream position: aStream position  - 1.
	aStream << ')'; lf