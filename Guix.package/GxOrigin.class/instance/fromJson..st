initialization
fromJson: aDictionary
	data := (aDictionary associations reject: [ :each | each key = #type ]) asDictionary