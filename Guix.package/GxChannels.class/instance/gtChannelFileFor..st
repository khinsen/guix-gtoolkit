inspecting
gtChannelFileFor: aView
	<gtView>
	^ aView forward
		title: 'Channel file';
		priority: 2;
		object: [ self schemeDefinitionFile contents ];
		view: #gtStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons clipboard
				tooltip: 'Copy to clipboard'
				action: [ Clipboard clipboardText: self schemeDefinitionFile contents ];
		yourself