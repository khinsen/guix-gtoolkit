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
			channels at: channel name put: channel ]