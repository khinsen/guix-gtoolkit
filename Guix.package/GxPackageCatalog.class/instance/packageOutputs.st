operating
packageOutputs
	^ GxPackageOutputGroup new
		guix: self guix;
		packages: self packages;
		yourself