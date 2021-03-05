searching
gtGtSpotterForPackagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 1;
		title: 'Packages';
		allCandidates: [ packages ];
		filter: GtFilterSubstrings;
		candidatesLimit: 7;
		itemName:#name