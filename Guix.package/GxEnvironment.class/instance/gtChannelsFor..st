inspecting
gtChannelsFor: aView
	<gtView>
	^ aView forward
		title: 'Channels';
		priority: 2;
		object: [ channels ];
		view: #gtChannelsFor:;
		yourself