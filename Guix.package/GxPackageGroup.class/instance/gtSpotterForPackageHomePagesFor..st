inspecting
gtSpotterForPackageHomePagesFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 3;
		title: 'Home pages';
		items: [ visiblePackages ];
		filterBySubstring;
		itemName: #homePage