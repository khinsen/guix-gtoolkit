operating
runPackageBuilder
	guix schedule:
		(GxPackageBuilder new
			guix: guix;
			package: self)