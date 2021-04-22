initialize - release
initialize
	super initialize.
	gxCommand := ''.
	gxArguments := #().
	"Setting at least one environment variable is the only way to
	 prevent OSSUnixSubprocess from inheriting the variables of
	 the Pharo process. So let's set one that hopefully doesn't
	 do any harm."
	self environmentAt: 'GxGuix' put: 'true'