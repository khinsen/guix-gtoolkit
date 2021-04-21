persistence
writeSchemeDefinitionTo: aStream
	aStream << '(list'; lf.
	channels do: [ :each | aStream << each asSchemeCode; lf ].
	aStream position: aStream position  - 1.
	aStream << ')'; lf