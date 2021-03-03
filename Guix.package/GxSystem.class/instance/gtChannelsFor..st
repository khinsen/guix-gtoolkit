inspecting
gtChannelsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Channels';
		priority: 5;
		items: [ self initializeChannels ];
		column: 'Name' text: #name;
		column: 'Commit' text: #commit;
		yourself