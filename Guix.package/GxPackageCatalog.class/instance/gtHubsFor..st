inspecting
gtHubsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Dependency Hubs';
		priority: 8;
		items: [ self dependencyHubs ];
		column: 'Package source' text: #key;
		column: 'Dependents' text: #value;
		send: [ :each | packages packages select: [ :p |
							p source includes: each key ] ];
		yourself