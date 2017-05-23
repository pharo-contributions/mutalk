accessing
methodWithTwoSendersModifiedFirst
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | true] 
		ifNone: [0]