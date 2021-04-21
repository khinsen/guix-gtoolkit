persistence
saveManifest
	directory ifNotNil: [
		directory / 'manifest.scm'
			writeStreamDo: [ :s |
				self writeManifestTo: s ] ]