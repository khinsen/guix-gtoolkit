comparing
= otherChannel
	self species = otherChannel species ifFalse: [ ^ false ].
	^ (name = otherChannel name) and: [ commit = otherChannel commit ]
