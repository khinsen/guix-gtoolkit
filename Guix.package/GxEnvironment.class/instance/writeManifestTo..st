persistence
writeManifestTo: s
		s << '(specifications->manifest ''('; lf.
		packageOutputs do: [ :each |
			s << '  "'; << each value shortestSpecification; << '"'; lf ].
		s << '))'; lf