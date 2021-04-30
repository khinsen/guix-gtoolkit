initialization
initializePackages
	| jsonFile objectInfo numberOfObjects |
	jsonFile := self packageInfoFile.
	jsonFile isFile ifFalse: [ self buildObjectInfo ].
	objectInfo := (NeoJSONReader on: jsonFile readStream) next.
	numberOfObjects := objectInfo size.
	guixObjects := Array new: numberOfObjects.
	packagesBySpecification := Dictionary new.
	numberOfObjects to: 1 by: -1 do: [ :index |
		| item |
		item := GxObject
					fromJson: (objectInfo at: numberOfObjects - index + 1)
					forGuix: guix.
		guixObjects at: index put: item.
		(item isPackage and: [ item isHidden not ]) ifTrue: [
			packagesBySpecification at: item specification
				ifPresent: [ self error: 'Duplicate package ', item specification ]
				ifAbsentPut: [ item ] ] ].
	packages := GxPackageGroup new packages: (guixObjects select: #isPackage).