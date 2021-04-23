accessing
process
	^ process ifNil: [
		process := gxEnvironment newSubprocess
			inheritEnvironmentAt: 'HOME';
			inheritEnvironmentAt: 'LANG';
			inheritEnvironmentAt: 'USER';
			inheritEnvironmentAt: 'USERNAME';
			inheritEnvironmentAt: 'DISPLAY';
			yourself ]