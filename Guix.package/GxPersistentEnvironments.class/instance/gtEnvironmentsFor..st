accessing
gtEnvironmentsFor: aView
	<gtView>
	^ aView list
		items: [ self persistentEnvironments ];
		itemText: [ :each | each basename ];
		send: [ :each | GxEnvironment from: each ]
		yourself