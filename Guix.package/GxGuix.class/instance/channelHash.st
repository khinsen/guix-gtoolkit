channels
channelHash
	^ SHA256 hashMessage:
			(self channels values
				flatCollect: [ :each | 
					{ each name. each commit } ])
					printString