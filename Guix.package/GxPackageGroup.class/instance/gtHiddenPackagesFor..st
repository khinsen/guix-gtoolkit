inspecting
gtHiddenPackagesFor: aView
	<gtView>
	^ aView columnedList
		title: 'Hidden packages';
		priority: 3;
		items: [ packages select: #isHidden ];
		column: 'Name' text: #name;
		column: 'Version' text: #version;
		yourself