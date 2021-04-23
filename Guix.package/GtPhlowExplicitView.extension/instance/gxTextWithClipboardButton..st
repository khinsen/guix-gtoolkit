*Guix
gxTextWithClipboardButton: aBlock
	self gxText: aBlock.
	self
		actionButtonIcon: BrGlamorousVectorIcons clipboard
		tooltip: 'Copy to clipboard'
		action: [ Clipboard clipboardText: aBlock value ].