searching
gtGtSpotterForChannelsFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 4;
		title: 'Channels';
		allCandidates: [ packages select: [ :each | each channels size > 1 ] ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: [ :each |
			| channelNames |
			channelNames := (each channels
								collect: #name
								thenReject: [ :n | n = #guix ]).
			', ' join: channelNames ]