inspecting
gtSpotterForPackageDescriptionsFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 2;
		title: 'Descriptions';
		allCandidates: [ packageOutputs ];
		filter: GtFilterSubstrings;
		candidatesLimit: 7;
		itemName: [ :each |
			each package synopsis, ' ',
			each package description ]