accessing
packages: aCollection
	packages := aCollection.
	packageOutputs := packages flatCollect: #outputs.
	visiblePackageOutputs := (packages reject: #isHidden) flatCollect: #outputs