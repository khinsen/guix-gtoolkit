inspecting
gtReferrersFor: aView
	<gtView>
	^ self referrers
		ifEmpty: [ aView empty ]
		ifNotEmpty: [ :items |
			aView list
			title: 'Referrers';
			priority: 4;
			items: items;
			yourself ]