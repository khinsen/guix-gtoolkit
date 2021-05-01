inspecting
gtHiddenPackagesFor: aView
	<gtView>
	^ aView columnedList
		title: 'Hidden packages';
		priority: 3;
		items: [ (packages select: #isHidden) sorted: [ :a :b |
			a name <= b name
			or: [ a name = b name
					and: [ a version <= b version ] ] ] ];
		column: 'Name' text: #name;
		column: 'Version' text: #version;
		yourself