inspecting
gtSpotterForPackageHomePagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 3;
		title: 'Home pages';
		allCandidates: [ packageOutputs ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: [ :each | each package homePage ];
		yourself