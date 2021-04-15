inspecting
gtOutputsFor: aView
	<gtView>
	| view |
	view := aView columnedList
		title: 'Outputs';
		priority: 6;
		items: [ outputs ];
		column: 'Name' text: #output;
		column: 'Store path' text: #storePath;
		column: 'Available' text: #isInStore;
		updateWhen: GxPackageBuilt in: [ guix announcer ].
	self isInStore ifFalse: [
		view
			actionButtonIcon: BrGlamorousVectorIcons repair
				tooltip: 'Build package'
				action: [ self build ] ].
	^ view