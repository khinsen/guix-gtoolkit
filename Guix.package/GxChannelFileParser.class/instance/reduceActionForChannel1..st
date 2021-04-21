generated-reduction actions
reduceActionForChannel1: nodes
	^ GxChannel new
		name: (nodes at: 3);
		url: (nodes at: 4);
		commit: (nodes at: 5);
		yourself