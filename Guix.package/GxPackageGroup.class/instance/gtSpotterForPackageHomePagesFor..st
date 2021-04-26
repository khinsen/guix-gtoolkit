inspecting
gtSpotterForPackageHomePagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 3;
		title: 'Home pages';
		allCandidates: [ visiblePackages ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: #homePage