inspecting
gtSpotterForChannelsFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 4;
		title: 'Channels';
		items: [ | groups |
			groups := (packages select: [ :each | each channels size > 1 ])
					groupedBy: [ :aPackage | ', ' join: (aPackage channels collect: #name thenReject: [ :n | n = #guix ]) ].
			groups associations
				collect: [ :each | 
					GxPackageOutputGroup new
						guix: self guix;
						packages: each value;
						name: each key;
						yourself ] ];
		filterBySubstring;
		itemName: #name