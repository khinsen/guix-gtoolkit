initialization
initializeChannels
	| channelData |
	self runReplCommand:
		'(use-modules
			(guix channels)
			(guix describe))'.
	self runReplCommand:
		'(define (channel-info channel)
			`((name .  ,(channel-name channel))
			(url . ,(channel-url channel))
			(commit . ,(channel-commit channel))))'.
	channelData := self runReplCommandAndParse:
		'(map channel-info (current-channels))'.
	channels := channelData collect: [ :each |
		GxChannel new
			name: (each at: #name);
			url: (each at: #url);
			commit: (each at: #commit);
			yourself ]