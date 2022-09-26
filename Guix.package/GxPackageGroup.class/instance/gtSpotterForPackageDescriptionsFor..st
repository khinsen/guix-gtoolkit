inspecting
gtSpotterForPackageDescriptionsFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 2;
		title: 'Descriptions';
		items: [ visiblePackages ];
		filterBySubstring;
		itemName: [ :each |
			each synopsis, ' ',
			each description ]