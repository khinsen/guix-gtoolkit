accessing
requisites
	^ requisites ifNil: [
		requisites := self relatedItemsOfType: 'requisites' ]