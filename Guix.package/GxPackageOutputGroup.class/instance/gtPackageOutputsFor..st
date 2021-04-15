inspecting
gtPackageOutputsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Package Outputs';
		priority: 1;
		items: [ self packageOutputs ];
		column: 'Name' text: [ :each | each package name ];
		column: 'Version' text: [ :each | each package version ];
		column: 'Output' text: #output;
		yourself