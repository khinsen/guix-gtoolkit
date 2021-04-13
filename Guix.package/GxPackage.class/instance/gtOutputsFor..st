inspecting
gtOutputsFor: aView
	<gtView>
	| view |
	view := aView columnedList
		title: 'Outputs';
		priority: 6;
		items: [ self storePaths associations ];
		column: 'Name' text: #key;
		column: 'Store path' text: #value;
		column: 'Available' text: [ :each |
			each value asFileReference isDirectory ];
		send: [ :each | each value asFileReference ];
		updateWhen: GxPackageBuilt in: [ guix announcer ].
	self isInStore ifFalse: [
		view
			actionButtonIcon: BrGlamorousVectorIcons repair
				tooltip: 'Build package'
				action: [ self runPackageBuilder ] ].
	^ view