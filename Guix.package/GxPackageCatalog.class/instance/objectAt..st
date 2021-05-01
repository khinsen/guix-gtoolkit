accessing
objectAt: anInteger
	"The indices come from Scheme and are zero-based!"
	^ guixObjects at: anInteger + 1