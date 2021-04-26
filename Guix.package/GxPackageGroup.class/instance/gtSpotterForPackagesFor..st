inspecting
gtSpotterForPackagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 1;
		title: 'Packages';
		allCandidates: [ visiblePackages ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: #name