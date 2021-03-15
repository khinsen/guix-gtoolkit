searching
gtGtSpotterForPackageHomePagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 3;
		title: 'Home pages';
		allCandidates: [ packages ];
		filter: GtFilterSubstrings;
		candidatesLimit: 7;
		itemName: #homePage