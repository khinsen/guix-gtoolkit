inspecting
gtSpotterForChannelsFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 4;
		title: 'Channels';
		items: [ | groups |
			groups := (visiblePackages select: [ :each | each channels size > 1 ])
					groupedBy: [ :aPackage | ', ' join: (aPackage channels collect: #name thenReject: [ :n | n = #guix ]) ].
			groups associations
				collect: [ :each | 
					GxPackageGroup new
						packages: each value;
						name: each key;
						yourself ] ];
		filterBySubstring;
		itemName: #name