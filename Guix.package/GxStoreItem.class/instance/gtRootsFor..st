accessing
gtRootsFor: aView
	<gtView>
	^ aView mondrian
		title: 'Roots';
		priority: 7;
		painting: [ :m |
			| nodeShape edgeShape arrowColor |
			nodeShape := [ :node |
				| color |
				color := node isRoot
					ifTrue: [ Color red ]
					ifFalse: [ node = self
								ifTrue: [ Color blue ]
								ifFalse: [ Color black ] ].
				BlElement new
					background: Color transparent;
					border: (BlBorder paint: color width: 2);
					padding: (BlInsets all: 5);
					size: 5@5;
					zIndex: 10 ].
			arrowColor := Color gray alpha: 0.5.
			edgeShape := [ :x |
				BlLineElement new
					toHead:
						(BlArrowheadSimpleArrow new
							border: (BlBorder
										paint: arrowColor
									width: 1));
					border: (BlBorder
								paint: arrowColor
								width: 1) ].
			self
				withDeep: [ :eachItem |
					eachItem referrers reject: [ :each | eachItem = each ] ]
				do: [ :each |
						m nodes
							stencil: nodeShape;
							with: { each } ]
				relationDo: [ :from :to |
					m edges
						shape: edgeShape;
						connectAssociations: { from -> to }].
			m layout custom: GtGraphHorizontalTreeLayout new ]