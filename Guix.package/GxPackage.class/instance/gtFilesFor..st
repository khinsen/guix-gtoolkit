inspecting
gtFilesFor: aView
	<gtView>
	| view |
	view := aView forward
		title: 'Files';
		priority: 5;
		object: [ (self storePaths at: #out) asFileReference ];
		view: #gtTreeFor:;
		updateWhen: GxPackageBuilt in: GxGuix announcer.
	self outIsInStore ifFalse: [
		view
			actionButtonIcon: BrGlamorousVectorIcons repair
				tooltip: 'Build package'
				action: [ [ self build ] fork ] ].
	^ view