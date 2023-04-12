inspecting
gtDeriversFor: aView
	<gtView>
	^ self derivers
		ifEmpty: [ aView empty ]
		ifNotEmpty: [ :items |
			aView list
			title: 'Derivers';
			priority: 5;
			items: items;
			yourself ]