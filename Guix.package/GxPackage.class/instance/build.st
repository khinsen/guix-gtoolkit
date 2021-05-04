operating
build
	self guix schedule:
		(GxPackageBuilder new
			guix: self guix;
			package: self)