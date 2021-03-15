generated-reduction actions
reduceActionForString1: nodes
	^ (nodes at: 1) value allButFirst allButLast
		copyReplaceAll: '\n'
		with: (String with: Character cr)