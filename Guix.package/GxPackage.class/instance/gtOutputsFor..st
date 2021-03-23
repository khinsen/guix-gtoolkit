inspecting
gtOutputsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Outputs';
		priority: 6;
		items: [ self storePaths associations ];
		column: 'Name' text: #key;
		column: 'Store path' text: #value;
		column: 'Available' text: [ :each |
			each value asFileReference isDirectory ];
		send: [ :each | each value asFileReference ];
		yourself