inspecting
gtBuildLogFor: aView
	<gtView>
	^ aView explicit
		title: 'Build log';
		priority: 5;
		stencil: [
			BrEditorElement new
				margin: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c vertical matchParent. 
					c horizontal matchParent ];
				editor: ((BrTextEditor new
					beLineBased;
					beReadOnlyWithSelection;
					text: (buildLog asRopedText
							glamorousRegularFontAndSize);
					moveCursorTo: buildLog size) );
				scrollToLast ]