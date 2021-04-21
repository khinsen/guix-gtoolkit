accessing
persistentEnvironments
	^ GxGuix environmentDirectory children select: [ :each |
		each isDirectory and: [ 
		(each / 'channels.scm') exists and: [
		(each / 'manifest.scm') exists ] ] ]