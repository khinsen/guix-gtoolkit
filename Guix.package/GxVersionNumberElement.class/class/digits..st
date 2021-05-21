accessing
digits: aString
	| instance |
	instance := self new: aString size.
	1 to: instance size do: [ :index |
		instance at: index put: (aString at: index) ].
	^ instance