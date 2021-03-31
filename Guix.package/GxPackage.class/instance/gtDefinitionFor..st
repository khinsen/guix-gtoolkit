accessing
gtDefinitionFor: aView
	<gtView>
	| sourceFile |
	sourceFile := (location at: #file) asFileReference.
	sourceFile isFile ifFalse: [ ^ aView empty ].
	^ aView explicit
		title: 'Definition';
		priority: 7;
		stencil: [
			| source start end |
			source := sourceFile contents.
			start := (source indexForLine: (location at: #line) - 1)
							+ (location at: #column).
			end := (source findCloseParenthesisFor: start) - 1.
			source := source asRopedText
						glamorousCodeFontAndSize.
			(source from: start to: end) foreground: Color blue.
			BrEditorElement new 
				padding: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				editor: (BrTextEditor new
					beLineBased;
					beReadOnlyWithSelection;
					text: source;
					moveCursorTo: start);
				scrollToPosition: (location at: #line) - 1 ]