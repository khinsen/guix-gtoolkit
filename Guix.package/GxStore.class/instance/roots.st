accessing
roots
	^ (self itemsOfType: 'list-roots')
		asSet asArray sorted
		collect: [ :each | GxGCRoot link: each asFileReference ]