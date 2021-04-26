inspecting
gtHiddenPackagesFor: aView
	<gtView>
	^ aView forward
		title: 'Hidden packages';
		priority: 3;
		object: [ packages ];
		view: #gtHiddenPackagesFor:;
		yourself