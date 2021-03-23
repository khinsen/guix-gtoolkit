inspecting
gtPackagesFor: aView
	<gtView>
	^ aView columnedList
		title: 'Packages';
		priority: 1;
		items: [ packages ];
		column: 'Name' text: #name;
		column: 'Version' text: #version;
		actionStencil: [ :anElement |
			GtSpotterDropdownButtonStencil new
				object: self guix;
				tooltip: 'Add Package';
				icon: BrGlamorousVectorIcons add;
				actOn: [ :anActOnEvent :anItem | 
					self addPackage: anItem.
					anActOnEvent beActed ] ]
		tooltip: 'Add Package';
		updateWhen: GxEnvironmentModified in: GxGuix announcer;
		yourself