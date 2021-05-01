inspecting
gtPackagesFor: aView
	<gtView>
	^ aView columnedList
		title: 'Packages';
		priority: 1;
		items: [ visiblePackages sorted: [ :a :b |
			a name <= b name
			or: [ a name = b name
					and: [ a version <= b version ] ] ] ];
		column: 'Name' text: #name;
		column: 'Version' text: #version;
		yourself