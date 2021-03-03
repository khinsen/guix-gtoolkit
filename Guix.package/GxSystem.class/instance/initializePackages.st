initialization
initializePackages
	packages := OrderedCollection new.
	(self executeCommand: #('package' '-A')) linesDo: [ :eachLine |
		| fields package |
		fields := Character tab split: eachLine.
		package := GxPackage new
			name: fields first;
			version: fields second;
			outputs: fields third;
			definition: fields fourth.
		packages add: package ]