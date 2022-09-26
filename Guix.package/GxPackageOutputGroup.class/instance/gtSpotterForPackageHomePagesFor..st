inspecting
gtSpotterForPackageHomePagesFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 3;
		title: 'Home pages';
		items: [ visiblePackageOutputs ];
		filterBySubstring;
		itemName: [ :each | each package homePage ];
		yourself