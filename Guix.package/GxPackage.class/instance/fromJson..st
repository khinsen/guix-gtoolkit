initialization
fromJson: aDictionary
	name := (aDictionary at: #name) asSymbol.
	version := aDictionary at: #version.
	shortestSpecification := aDictionary at: #'shortest-specification'.
	shortestSpecification = false ifTrue: [ shortestSpecification := nil ].
	outputs := (aDictionary at: #outputs)
		collect: [ :each |
			GxPackageOutput new
				package: self;
				output: each asSymbol ].
	inputs := aDictionary at: #inputs.
	buildSystem := aDictionary at: #'build-system'.
	channels := (aDictionary at: #channels)
		collect: [ :each | catalog guix channels channelNamed: each ].
	location := aDictionary at: #location.
	location at: #file put: (location at: #file) asFileReference.
	synopsis := aDictionary at: #synopsis.
	description := aDictionary at: #description.
	licenses := aDictionary at: #licenses.
	homePage := aDictionary at: #'home-page'.
	aDictionary at: #'store-paths' ifPresent: [ :sp |
		storePaths := sp ]