accessing
storePath
	^ storePath ifNil: [ storePath := package storePaths at: output ]