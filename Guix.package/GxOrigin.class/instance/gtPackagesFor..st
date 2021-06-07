accessing
gtPackagesFor: aView
	<gtView>
	^ aView list
		title: 'Packages';
		priority: 1;
		items: [ catalog packages select: [ :p | p source includes: self ] ];
		yourself