inspecting
manifest
	^ String streamContents: [ :s | self writeManifestTo: s ]