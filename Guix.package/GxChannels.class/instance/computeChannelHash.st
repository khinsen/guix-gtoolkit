initialization
computeChannelHash
	channelHash := SHA256 hashMessage:
				((channels values sorted: [ :a :b | a name <= b name ])
					flatCollect: [ :each | 
						{ each name. each commit } ])
						printString