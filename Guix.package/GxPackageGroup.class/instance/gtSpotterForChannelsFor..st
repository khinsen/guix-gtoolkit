inspecting
gtSpotterForChannelsFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 4;
		title: 'Channels';
		allCandidates: [
			| groups |
			groups :=
				(visiblePackages select: [ :each | each channels size > 1 ])
					groupedBy: [ :aPackage |
					', ' join: (aPackage channels
									collect: #name
									thenReject: [ :n | n = #guix ]) ].
			groups associations collect: [ :each |
				GxPackageGroup new
					packages: each value;
					name: each key;
					yourself ] ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: #name