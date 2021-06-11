accessing
gtDescriptionFor: aView
	<gtView>
	^ aView explicit
		title: 'Description';
		priority: 0;
		disableAsync;
		stencil: [
			(LeTextSnippet new string: self markdownDescription)
				asPreviewElement ];
			yourself