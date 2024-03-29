inspecting
gtPackageOutputsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Package Outputs';
		priority: 1;
		items: [ packageOutputs ];
		send: #value;
		column: 'Specification' text: #key;
		column: 'Name' text: [ :each | each value package name ];
		column: 'Version' text: [ :each | each value package version ];
		column: 'Output' text: [ :each | each value output ];
		actionStencil: [ :anElement |
			GtSpotterDropdownButtonStencil new
				object: channels packageOutputs;
				tooltip: 'Add Package Output';
				icon: BrGlamorousVectorIcons add;
				actOn: [ :anActOnEvent :anItem | 
					self addPackageOutput: anItem.
					anActOnEvent beActed ] ]
		tooltip: 'Add Package';
		updateWhen: GxEnvironmentModifiedEvent in: self guix announcer;
		yourself