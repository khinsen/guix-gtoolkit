inspecting
gtReferencesFor: aView
	<gtView>
	^ self references
		ifEmpty: [ aView empty ]
		ifNotEmpty: [ :items |
			aView list
			title: 'References';
			priority: 2;
			items: items;
			yourself ]