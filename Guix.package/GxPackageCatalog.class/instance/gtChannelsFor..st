inspecting
gtChannelsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Channels';
		priority: 5;
		items: [ channels values ];
		column: 'Name' text: #name;
		column: 'Commit' text: #commit;
		yourself