inspecting
gtChannelsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Channels';
		priority: 1;
		items: [ channels values sorted: [ :a :b | a name <= b name ] ];
		column: 'Name' text: #name;
		column: 'Commit' text: #commit;
		yourself