packages
packageCatalog
	^ packageCatalog ifNil: [
		packageCatalog := GxPackageCatalog for: self ]