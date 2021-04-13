inspecting
gtTasksFor: aView
	<gtView>
	^ aView list
		title: 'Tasks';
		priority: 6;
		items: [ tasks ];
		actionUpdateButtonTooltip: 'Update task list';
		yourself