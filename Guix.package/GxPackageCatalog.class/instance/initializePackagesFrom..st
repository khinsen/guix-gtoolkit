initialization
initializePackagesFrom: jsonFile
	| objectInfo numberOfObjects |
	objectInfo := (NeoJSONReader on: jsonFile readStream) next.
	numberOfObjects := objectInfo size.
	guixObjects := objectInfo collect: [ :each |
		GxObject fromJson: each catalog: self ].
	packages := GxPackageGroup new packages: (guixObjects select: #isPackage).
	self initializePackagesByName.
	self initializeDependents.