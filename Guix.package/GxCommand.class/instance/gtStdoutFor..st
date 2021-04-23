accessing
gtStdoutFor: aView
	<gtView>
	^ aView explicit
		title: 'Output';
		priority: 0;
		gxTextWithClipboardButton: [ self stdout ];
		yourself