accessing
writeChannelTo: aStream
	aStream
		<< '  (channel'; lf;
		<< '    (name '''; << name; << ')'; lf;
		<< '    (url "'; << url; << '")'; lf;
		<< '    (commit "'; << commit; << '"))'.