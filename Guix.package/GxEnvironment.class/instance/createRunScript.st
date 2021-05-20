persistence
createRunScript
	| script scriptFile |
	scriptFile := (directory / 'run').
	script := '#!/bin/bash
dir=`dirname "$0"`
guix time-machine -C $dir/channels.scm -- environment -m $dir/manifest.scm -- $*'.
	scriptFile writeStreamDo: [ :s | s << script ].
	scriptFile permissions: (FileSystemPermission posixPermissions: 8r755)