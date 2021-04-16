inspecting
gtChannelsFor: aView
	<gtView>
	^ aView forward
		title: 'Channels';
		priority: 5;
		object: [ channels ];
		view: #gtChannelsFor:;
		yourself