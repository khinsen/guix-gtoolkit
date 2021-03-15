initialization
packageData: packageData
	name := packageData at: #name.
	version := packageData at: #version.
	outputs := packageData at: #outputs.
	location := packageData at: #location.
	synopsis := packageData at: #synopsis.
	description := packageData at: #description.
	licenses := packageData at: #licenses.
	homePage := packageData at: #'home-page'.