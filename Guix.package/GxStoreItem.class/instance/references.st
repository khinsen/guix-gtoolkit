accessing
references
	^ references ifNil: [
		references := self relatedItemsOfType: 'references' ]