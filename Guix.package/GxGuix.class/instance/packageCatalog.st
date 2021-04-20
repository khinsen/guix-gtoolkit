operating
packageCatalog
	^ packageCatalog ifNil: [
		packageCatalog := GxPackageCatalog for: channels ]