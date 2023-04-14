accessing
rootFor: aFileReference 
	^ self roots
		detect: [ :each | each file  = aFileReference ]
		ifNone: [ nil ]