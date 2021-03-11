initialization
initializeChannels
	| channelData |
	self replCommand:
		'(use-modules
			(guix channels)
			(guix describe))'.
	self replCommand:
		'(define (channel-info channel)
			`((name .  ,(channel-name channel))
			(url . ,(channel-url channel))
			(commit . ,(channel-commit channel))))'.
	channelData := self replCommand:
		'(map channel-info (current-channels))'.
	channels := channelData first collect: [ :each |
		GxChannel new
			name: (each at: #name);
			url: (each at: #url);
			commit: (each at: #commit);
			yourself ]