persistence
saveManifest
	self isPersistent ifTrue: [
		self manifestFile
			writeStreamDo: [ :s |
				s << self manifest ] ]