persistence
saveManifest
	self isPersistent ifTrue: [
		self manifestFile
			writeStreamDo: [ :s |
				self writeManifestTo: s ] ]