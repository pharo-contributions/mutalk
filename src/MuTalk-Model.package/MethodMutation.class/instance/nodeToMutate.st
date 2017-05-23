accessing
nodeToMutate
	nodeToMutate ifNil: [ self lookupForNodes ].
	^ nodeToMutate