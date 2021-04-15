accessing
replProcessPort
	"In the range of private ports: 49152 to 65535 "
	| hash port |
	hash := self channelHash last: 2.
	port := 49152 + (256 * (hash first bitAnd: 16r3F)) + hash second.
	self assert: port >= 49152.
	self assert: port <= 65535.
	^ port