inspecting
gtRelatedPackagesFor: aView
	<gtView>
	| sources |
	sources := self source.
	sources ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Related Packages';
		priority: 3;
		object: [ sources first ];
		view: #gtPackagesFor:;
		yourself.