accessing
gtStderrFor: aView
	<gtView>
	^ aView explicit
		title: 'Error output';
		priority: 1;
		gxTextWithClipboardButton: [ self stderr ];
		yourself