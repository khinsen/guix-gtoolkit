inspecting
gtSpotterForPackageHomePagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 3;
		title: 'Home pages';
		allCandidates: [ visiblePackageOutputs ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: [ :each | each package homePage ];
		yourself