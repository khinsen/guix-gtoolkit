inspecting
gtSpotterForPackageDescriptionsFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 2;
		title: 'Descriptions';
		items: [ visiblePackageOutputs ];
		filterBySubstring;
		itemName: [ :each |
			each package synopsis, ' ',
			each package description ]