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
		updateWhen: GxPackageBuiltEvent in: [ self guix announcer ].
	self outIsInStore ifFalse: [
		view
			actionButtonIcon: BrGlamorousVectorIcons repair
				tooltip: 'Build package'
				action: [ self build ] ].
	^ view