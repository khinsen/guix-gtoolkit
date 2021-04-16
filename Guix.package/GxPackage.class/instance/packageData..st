initialization
packageData: packageData
	name := (packageData at: #name) asSymbol.
	version := packageData at: #version.
	outputs := (packageData at: #outputs)
		collect: [ :each |
			GxPackageOutput new
				package: self;
				output: each asSymbol ].
	channels := (packageData at: #channels)
		collect: [ :each | guix channels channelNamed: each ].
	location := packageData at: #location.
	location at: #file put: (location at: #file) asFileReference.
	synopsis := packageData at: #synopsis.
	description := packageData at: #description.
	licenses := packageData at: #licenses.
	homePage := packageData at: #'home-page'.