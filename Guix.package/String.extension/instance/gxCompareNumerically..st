*Guix
gxCompareNumerically: aString
	"Answer a comparison code telling how the receiver sorts relative to aString:
		1 - before
		2 - equal
		3 - after.
	The comparison splits the strings into digit and non-digit substrings and compares
	digit substrings numerically, prefixed with an implied decimal dot.
	"
	| a b index |
	a := self gxSplitAtDigitSequences.
	b := aString gxSplitAtDigitSequences.
	[ a ifEmpty: [ b ifEmpty: [ ^ 2 ] ifNotEmpty: [ ^ 1 ] ]
		ifNotEmpty: [
			b ifEmpty: [ ^ 3 ].
			a first isNumber = b first isNumber
				ifFalse: [ ^ self compare: aString caseSensitive: true ].
			a first < b first ifTrue: [ ^ 1 ].
			a first > b first ifTrue: [ ^ 3 ].
			a removeFirst.
			b removeFirst ] ] repeat