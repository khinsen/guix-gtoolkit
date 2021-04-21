persistence
writeManifestTo: s
		s << '(specifications->manifest ''('; lf.
		packageOutputs do: [ :each |
			s << '  "'; << each specification; << '"'; lf ].
		s << '))'; lf