initialization
fromJson: channelData
	channels := Dictionary new.
	channelData do: [ :each |
		| channel |
		channel := GxChannel new
			name: (each at: #name) asSymbol;
			url: (each at: #url);
			commit: (each at: #commit);
			yourself.
		channel beReadOnlyObject.
	channels at: channel name put: channel ].
	self computeChannelHash.	
	self beReadOnlyObject.