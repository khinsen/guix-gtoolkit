inspecting
gtHubsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Dependency Hubs';
		priority: 8;
		items: [ self dependencyHubs ];
		column: 'Package source' text: #key;
		column: 'Dependents' text: [ :each | each value size ];
		send: [ :each | each value asOrderedCollection
					sorted: [ :a :b | a displayString <= b displayString ] ];
		yourself