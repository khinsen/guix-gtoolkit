executing
timeMachineArguments
	"We could always use the explicit time machine arguments,
	 and we do for persistent environments in the spirit of
	 reproducibility. But when the channels are the current ones,
	 using time-machine adds overhead in the current Guix
	 implementation, and it makes the command line more complex.
	 So for on-the-fly environments, we leave them out."
	(self isPersistent not and: [ channels = GxChannels current ])
		ifTrue: [ ^ #() ].
	^ { 'time-machine'. '-C'. self channelFile fullName. '--' }