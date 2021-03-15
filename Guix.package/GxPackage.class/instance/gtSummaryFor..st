inspecting
gtSummaryFor: aView
	<gtView>
	^ aView forward
		title: 'Summary';
		priority: 0;
		object: [ self summary ];
		view: #gtStringFor:;
		yourself