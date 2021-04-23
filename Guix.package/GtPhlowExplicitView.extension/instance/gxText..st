*Guix
gxText: aBlock
	self stencil: [
		BrEditorElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c | 
				c vertical matchParent. 
				c horizontal matchParent ];
			editor: (BrTextEditor new
				text: ( aBlock value asRopedText
						glamorousRegularFontAndSize) ) ]