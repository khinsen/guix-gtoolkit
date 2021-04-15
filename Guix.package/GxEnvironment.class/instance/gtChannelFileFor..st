inspecting
gtChannelFileFor: aView
	<gtView>
	^ aView forward
		title: 'Channel file';
		priority: 5;
		object: [ self channelSpec ];
		view: #gtStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons clipboard
				tooltip: 'Copy to clipboard'
				action: [ Clipboard clipboardText: self commandLine ];
		actionUpdateButton;
		yourself