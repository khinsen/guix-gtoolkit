inspecting
gtSpotterForPackageDescriptionsFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 2;
		title: 'Descriptions';
		allCandidates: [ visiblePackages ];
		filter: GtFilterSubstrings;
		candidatesLimit: 7;
		itemName: [ :each |
			each synopsis, ' ',
			each description ]