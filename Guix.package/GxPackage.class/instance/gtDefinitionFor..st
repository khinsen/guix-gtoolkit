accessing
gtDefinitionFor: aView
	<gtView>
	| sourceFile |
	sourceFile := (location at: #file) asFileReference.
	sourceFile isFile ifFalse: [ ^ aView empty ].
	^ aView explicit
		title: 'Definition';
		priority: 4;
		stencil: [
			| definitionSource start end |
			definitionSource := sourceFile contents.
			start := (definitionSource gxIndexForLine: (location at: #line) - 1)
							+ (location at: #column).
			end := (definitionSource findCloseParenthesisFor: start) - 1.
			definitionSource := definitionSource asRopedText
						glamorousCodeFontAndSize.
			(definitionSource from: start to: end) foreground: Color blue.
			BrEditorElement new 
				padding: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				editor: (BrTextEditor new
					beLineBased;
					beReadOnlyWithSelection;
					text: definitionSource;
					moveCursorTo: start);
				scrollToPosition: (location at: #line) - 1 ]