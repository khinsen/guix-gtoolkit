executing
timeMachineArguments
	^ self = GxChannels current
		ifTrue: [ #() ]
		ifFalse: { 'time-machine'. '-C'. self channelFile fullName. '--' }