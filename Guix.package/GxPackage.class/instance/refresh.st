accessing
refresh
	| reply |
	reply := (GxGuix executeCommand:
				{ 'refresh'. self name asString })
				second.
	^ ' ' join: (' ' split: reply) allButFirst