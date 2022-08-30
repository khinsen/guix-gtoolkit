inspecting
gtGuixFor: anAction
	<gtAction>
	^ anAction button
		tooltip: 'Guix proxy';
		priority: 15;
		icon: BrGlamorousIcons debug;
		action: [ :aButton |
			aButton phlow spawnObject:
				self guix ]