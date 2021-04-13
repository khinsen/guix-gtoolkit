inspecting
gtSpotterForPackagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 1;
		title: 'Packages';
		allCandidates: [ packages ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: #name