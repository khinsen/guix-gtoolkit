inspecting
gtPackagesFor: aView
	<gtView>
	^ aView columnedList
		title: 'Packages';
		priority: 1;
		items: [ packages ];
		column: 'Name' text: #name;
		column: 'Version' text: #version;
		yourself