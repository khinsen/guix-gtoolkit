inspecting
gtAttributesFor: aView
	<gtView>
	^ aView forward
		title: 'Attributes';
		priority: 0;
		object: [ Dictionary
					with: #name -> name
					with: #url -> url
					with: #commit -> commit ]
		yourself