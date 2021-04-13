inspecting
gtSpotterForPackageHomePagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 3;
		title: 'Home pages';
		allCandidates: [ packages ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: #homePage