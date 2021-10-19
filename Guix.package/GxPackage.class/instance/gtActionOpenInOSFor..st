inspecting
gtActionOpenInOSFor: anAction
	<gtAction>
	| sourceFile button |
	sourceFile := (location at: #file) asFileReference.
	sourceFile isFile ifFalse: [ ^ anAction noAction ].
	^ anAction explicit stencil: [
		button := BrButton new.
		button
			aptitude: BrGlamorousButtonWithIconAptitude;
			action:  [ WebBrowser openOn: sourceFile fullName ];
			icon: BrGlamorousIcons go asElement;
			label: 'Open definition in OS' translated ]