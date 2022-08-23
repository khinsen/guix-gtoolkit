inspecting
gtEnvironmentFor: aView
	<gtView>
	^ aView forward
		title: 'Environment';
		priority: 3;
		object: [ gxEnvironment ];
		view: #gtPackageOutputsFor:;
		yourself