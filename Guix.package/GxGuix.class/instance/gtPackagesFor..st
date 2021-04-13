inspecting
gtPackagesFor: aView
	<gtView>
	^ aView forward
		title: 'Packages';
		priority: 1;
		object: [ packages ];
		view: #gtPackagesFor:;
		yourself