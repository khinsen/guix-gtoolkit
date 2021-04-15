scheme
manifest
	^ String streamContents: [ :s |
		s << '(specification->manifest ''('; cr.
		packageOutputs do: [ :each | s << '  "'; << each specification; << '"'; cr ].
		s << '))'; cr ]