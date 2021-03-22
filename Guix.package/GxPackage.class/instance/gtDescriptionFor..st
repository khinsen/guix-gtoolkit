inspecting
gtDescriptionFor: aView
	<gtView>
	^ aView explicit
		title: 'Description';
		priority: 0;
		disableAsync;
		stencil: [ (GtDocumenter forText: self pillarDescription) ];
		actionButtonIcon: BrGlamorousVectorIcons remove
			tooltip: 'Decrease font size'
			action: [ :aToggle :aTab | aTab viewContentElement decreaseNormalFontSize ];
		actionButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Increase font size'
			action: [ :aToggle :aTab | aTab viewContentElement increaseNormalFontSize ]