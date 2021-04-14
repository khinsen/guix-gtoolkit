operating
build
	guix schedule:
		(GxPackageBuilder new
			guix: guix;
			package: self)