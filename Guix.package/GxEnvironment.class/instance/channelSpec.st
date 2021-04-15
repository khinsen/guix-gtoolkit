scheme
channelSpec
	^ String streamContents: [ :s |
		s << '(list'; cr.
		channels do: [ :each | s << each asSchemeCode; cr ].
		s << ')'; cr ]