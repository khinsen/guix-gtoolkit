inspecting
gtHubsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Dependency Hubs';
		priority: 8;
		items: [ self dependencyHubs ];
		column: 'Package' text: #first;
		column: 'Dependents' text: #second;
		column: '%' text: #third;
		send: #first;
		yourself