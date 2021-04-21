persistence
writeManifestTo: s
		s << '(specification->manifest ''('; lf.
		packageOutputs do: [ :each |
			s << '  "'; << each specification; << '"'; lf ].
		s << '))'; lf