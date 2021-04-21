persistence
writeSchemeDefinitionTo: aStream
	aStream << '(list'; lf.
	channels do: [ :each | each writeSchemeDefinitionTo: aStream. aStream lf ].
	aStream position: aStream position  - 1.
	aStream << ')'; lf