persistence
createRunScript
	| script scriptFile |
	scriptFile := (directory / 'run').
	script := {
		'#!/bin/bash'.
		'dir=`dirname "$0"`'.
		(' ' join: (#('guix'), self commandLineArguments, #('-- $*')))
			copyReplaceAll: directory fullName with: '$dir'.
	}.
	scriptFile writeStreamDo: [ :s | script do: [ :line | s << line ; lf ] ].
	scriptFile permissions: (FileSystemPermission posixPermissions: 8r755)