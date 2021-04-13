inspecting
gtFilesFor: aView
	<gtView>
	| view |
	view := aView explicit
		title: 'Files';
		priority: 5;
		stencil: [
			((self storePaths at: #out) asFileReference
				gtTreeFor: aView)
				asElement ];
		updateWhen: GxPackageBuilt in: [ guix announcer ].
	self outIsInStore ifFalse: [
		view
			actionButtonIcon: BrGlamorousVectorIcons repair
				tooltip: 'Build package'
				action: [ self runPackageBuilder ] ].
	^ view