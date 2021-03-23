accessing
gtFilesFor: aView
	<gtView>
	^ aView forward
		title: 'Files';
		priority: 5;
		object: [ (self storePaths at: #out) asFileReference ];
		view: #gtTreeFor:;
		yourself