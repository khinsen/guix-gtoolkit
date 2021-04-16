instance creation
for: aGxChannels
	| hash |
	hash := aGxChannels channelHash.
	self allInstancesDo: [ :each |
		each channels ifNotNil: [ :c | c channelHash = hash ifTrue: [ ^ each ] ] ].
	^ self new
		channels: aGxChannels;
		yourself