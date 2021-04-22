inspecting
gtChannelFileFor: aView
	<gtView>
	^ aView forward
		title: 'Channel file';
		priority: 2;
		object: [ self channelFile contents ];
		view: #gtStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons clipboard
				tooltip: 'Copy to clipboard'
				action: [ Clipboard clipboardText: self channelFile contents ];
		yourself