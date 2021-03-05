inspecting
gtSpecificationFor: aView
	<gtView>
	^ aView forward
		title: 'Specification';
		priority: 0;
		object: [ self specification ];
		view: #gtStringFor:;
		yourself