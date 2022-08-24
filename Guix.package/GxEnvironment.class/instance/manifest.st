inspecting
manifest
	^ GxGuix executeCommand:
		(' ' split: self commandLine) allButFirst asArray, #('--export-manifest')