inspecting
gtStoreItemFor: aView
	<gtView>
	self isInStore ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Store item';
		priority: 9;
		object: [ GxStoreItem file: self storePath asFileReference ];
		view: #gtRootsFor:;
		yourself