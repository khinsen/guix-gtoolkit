accessing
channels: aList
	channels := Dictionary new.
	aList do: [ :each |
		self assert: (each isKindOf: GxChannel).
		each beReadOnlyObject.
		channels at: each name put: each ].
	self computeChannelHash.	
	self beReadOnlyObject.