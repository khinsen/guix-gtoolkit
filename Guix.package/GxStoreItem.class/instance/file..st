accessing
file: aFileReferenceOrFilename
	file := aFileReferenceOrFilename isString
		ifTrue: [
			file := aFileReferenceOrFilename asFileReference ]
		ifFalse: [
			self assert:
				(aFileReferenceOrFilename isKindOf: FileReference).
			file := aFileReferenceOrFilename ]