persistence
schemeDefinitionFile
	| reference |
	reference := GxGuix cacheDirectory / (self channelHash hex, '.scm').
	reference isFile ifFalse: [
		reference writeStreamDo: [ :s |
			s << '(list'; lf.
			channels do: [ :each | s << each asSchemeCode; lf ].
			s position: s position  - 1.
			s << ')'; lf ] ].
	^ reference