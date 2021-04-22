persistence
channelFile
	"The contents of these two files ar the same. The reason for having
	 (and using) the copy under 'directory' is ensuring the independence
	 of persistent environments from temporary cache files."
	^ self isPersistent
		ifFalse: [ channels channelFile ]
		ifTrue: [ directory / 'channels.scm' ]