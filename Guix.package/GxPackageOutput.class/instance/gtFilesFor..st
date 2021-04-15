inspecting
gtFilesFor: aView
	<gtView>
	| view |
	view := aView explicit
		title: 'Files';
		priority: 1;
		stencil: [
			(self storePath asFileReference
				gtTreeFor: aView)
				asElement ];
		updateWhen: GxPackageBuilt in: [ package guix announcer ].
	self isInStore ifFalse: [
		view
			actionButtonIcon: BrGlamorousVectorIcons repair
				tooltip: 'Build package'
				action: [ package build ] ].
	^ view