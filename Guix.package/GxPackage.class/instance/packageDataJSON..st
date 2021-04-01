initialization
packageDataJSON: packageData
	name := (packageData at: #name) asSymbol.
	version := packageData at: #version.
	outputs := (packageData at: #outputs) collect: #asSymbol.
	channels := (packageData at: #channels)
		collect: [ :each | guix channels at: each ].
	location := packageData at: #location.
	location at: #file put: (location at: #file) asFileReference.
	synopsis := packageData at: #synopsis.
	description := packageData at: #description.
	licenses := packageData at: #licenses.
	homePage := packageData at: #'home-page'.