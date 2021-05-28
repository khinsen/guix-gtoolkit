inspecting
gtFilesFor: aView
	<gtView>
	| view |
	view := aView explicit
		title: 'Files';
		priority: 5;
		stencil: [
			(self path
				ifNil: [ aView empty ]
				ifNotNil: [ :p | p gtTreeFor: aView ])
				asElement ];
		updateWhen: GxEnvironmentBuiltEvent in: [ self guix announcer ].
	self path ifNil: [
		view
			actionButtonIcon: BrGlamorousVectorIcons repair
				tooltip: 'Build environment'
				action: [ self build ] ].
	^ view