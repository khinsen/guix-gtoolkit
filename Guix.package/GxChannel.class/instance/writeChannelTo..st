accessing
writeChannelTo: aStream
	aStream
		<< '  (channel'; lf;
		<< '    (name '''; << self name; << ')'; lf;
		<< '    (url "'; << self url; << '")'; lf;
		<< '    (commit "'; << self commit; << '"))'.