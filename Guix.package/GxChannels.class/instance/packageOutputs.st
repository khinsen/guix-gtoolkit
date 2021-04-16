packages
packageOutputs
	^ packageOutputs ifNil: [
		packageOutputs := self packageCatalog packageOutputs ]