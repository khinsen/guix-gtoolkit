instance creation
current
	^ GxGuix currentChannels detect: [ :each | each name = #guix ]