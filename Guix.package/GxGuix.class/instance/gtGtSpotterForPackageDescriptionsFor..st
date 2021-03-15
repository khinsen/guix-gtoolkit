searching
gtGtSpotterForPackageDescriptionsFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 2;
		title: 'Descriptions';
		allCandidates: [ packages ];
		filter: GtFilterSubstrings;
		candidatesLimit: 7;
		itemName: [ :each |
			each synopsis,
			Character cr asString,
			Character cr asString,
			each description ]