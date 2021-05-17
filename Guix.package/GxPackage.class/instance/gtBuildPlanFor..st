inspecting
gtBuildPlanFor: aView
	<gtView>
	^ aView mondrian
		title: 'Build plan';
		priority: 1;
		painting: [ :view | self buildPlanFor: view ]