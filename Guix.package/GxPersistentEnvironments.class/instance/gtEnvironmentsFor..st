accessing
gtEnvironmentsFor: aView
	<gtView>
	^ aView list
		title: 'Environments';
		priority: 0;
		items: [ self persistentEnvironments ];
		itemText: [ :each | each basename ];
		send: [ :each | GxEnvironment from: each ]
		yourself