inspecting
gtAttributesFor: aView
	<gtView>
	^ aView forward
		title: 'Attributes';
		priority: 0;
		object: [ Dictionary
					with: #name -> self name
					with: #url -> self url
					with: #commit -> self commit ]
		yourself