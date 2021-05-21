comparing
compare: stringA with: stringB collated: order
	"Inspired by but not idential to strverscmp in glibc."
	| nonZeroDigits numZerosA numZerosB |
	nonZeroDigits := '123456789'.
	numZerosA := stringA findDelimiters: nonZeroDigits startingAt: 1.
	numZerosB := stringB findDelimiters: nonZeroDigits startingAt: 1.
	"The number with more leading zeros is considered smaller."
	numZerosA > numZerosB ifTrue: [ ^ 1 ].
	numZerosA < numZerosB ifTrue: [ ^ 3 ].
	"Compare as integers if no leading zeros."
	numZerosA = 1 ifTrue: [
		| a b |
		a := stringA asInteger.
		b := stringB asInteger.
		a = b ifTrue: [ ^ 2 ].
		a < b ifTrue: [ ^ 1] ifFalse: [ ^ 3 ] ].
	"Else, compare lexigraphically"
	^ super compare: stringA with: stringB collated: order