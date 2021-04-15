accessing
commandLine
	"Only the main 'guix' channel can be specified on the time machine command line."
	self assert: channels size equals: 1.
	self assert: (channels includesKey: #guix).
	^ 'guix time-machine --commit=', (channels at: #guix) commit, ' --',
		' environment --pure --ad-hoc ',
		(' ' join: (packageOutputs collect: [ :each | each specification ]))