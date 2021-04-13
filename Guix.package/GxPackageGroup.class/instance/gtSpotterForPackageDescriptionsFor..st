inspecting
gtSpotterForPackageDescriptionsFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 2;
		title: 'Descriptions';
		allCandidates: [ packages ];
		filter: GtFilterSubstrings;
		candidatesLimit: 7;
		itemName: [ :each |
			each synopsis, ' ',
			each description ]