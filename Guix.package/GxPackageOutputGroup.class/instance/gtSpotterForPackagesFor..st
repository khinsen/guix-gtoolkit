inspecting
gtSpotterForPackagesFor: aStep
	<gtSearch>
	^ aStep listProcessor
		priority: 1;
		title: 'Packages';
		allCandidates: [ visiblePackageOutputs ];
		filter: GtFilterSubstring;
		candidatesLimit: 7;
		itemName: [ :each | each package name ];
		yourself