accessing
guixCommand
	self isCurrent ifTrue: [ ^ self class guixCommand ].
	