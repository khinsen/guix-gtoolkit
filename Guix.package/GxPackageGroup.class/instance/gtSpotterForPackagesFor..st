inspecting
gtSpotterForPackagesFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 1;
		title: 'Packages';
		items: [ visiblePackages ];
		filterBySubstring;
		itemName: #shortestSpecification