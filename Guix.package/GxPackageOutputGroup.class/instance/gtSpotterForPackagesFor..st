inspecting
gtSpotterForPackagesFor: aSearch
	<gtSearch>
	^ aSearch list
		priority: 1;
		title: 'Packages';
		items: [ visiblePackageOutputs ];
		filterBySubstring;
		itemName: [ :each | each package name ];
		yourself