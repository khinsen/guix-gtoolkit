inspecting
gtCommandLineFor: aView
	<gtView>
	^ aView explicit
		title: 'Command line';
		priority: 3;
		gxTextWithClipboardButton: [ self commandLine ];
		updateWhen: GxEnvironmentModifiedEvent in: self guix announcer;
		actionUpdateButton;
		yourself