accessing
commandLine
	^ guix guixCommand,
		' environment --pure --ad-hoc ',
		(' ' join: (packages collect: [ :each | each specification ]))