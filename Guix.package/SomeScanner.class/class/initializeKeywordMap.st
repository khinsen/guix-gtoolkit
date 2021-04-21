generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(10 'channel' 1) #(10 'commit' 2) #(10 'list' 3) #(10 'name' 4) #(10 'url' 5))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap