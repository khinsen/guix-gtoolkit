inspecting
gtCommandLineFor: aView
	<gtView>
	channels size > 1 ifTrue: [ ^ aView empty ].
	^ aView explicit
		title: 'Command line';
		priority: 3;
		stencil: [
			BrEditorElement new
				margin: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c vertical matchParent. 
					c horizontal matchParent ];
				editor: (BrTextEditor new
					text: ( self commandLine asRopedText
						glamorousRegularFontAndSize) ) ];
		updateWhen: GxEnvironmentModified in: guix announcer;
		actionButtonIcon: BrGlamorousVectorIcons clipboard
				tooltip: 'Copy to clipboard'
				action: [ Clipboard clipboardText: self commandLine ];
		actionUpdateButton;
		yourself