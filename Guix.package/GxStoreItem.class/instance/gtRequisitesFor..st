inspecting
gtRequisitesFor: aView
	<gtView>
	^ self requisites
		ifEmpty: [ aView empty ]
		ifNotEmpty: [ :items |
			aView list
			title: 'Requisites';
			priority: 3;
			items: items;
			yourself ]