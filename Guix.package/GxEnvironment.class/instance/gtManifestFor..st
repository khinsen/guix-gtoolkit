inspecting
gtManifestFor: aView
	<gtView>
	^ aView forward
		title: 'Manifest';
		priority: 6;
		object: [ self manifest ];
		view: #gtStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons clipboard
				tooltip: 'Copy to clipboard'
				action: [ Clipboard clipboardText: self commandLine ];
		actionUpdateButton;
		yourself