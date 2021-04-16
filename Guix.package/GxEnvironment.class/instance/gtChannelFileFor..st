inspecting
gtChannelFileFor: aView
	<gtView>
	^ aView forward
		title: 'Channel file';
		priority: 5;
		object: [ channels ];
		view: #gtChannelFileFor:;
		yourself