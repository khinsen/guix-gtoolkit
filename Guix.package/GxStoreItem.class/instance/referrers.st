accessing
referrers
	^ referrers ifNil: [
		referrers := self relatedItemsOfType: 'referrers' ]