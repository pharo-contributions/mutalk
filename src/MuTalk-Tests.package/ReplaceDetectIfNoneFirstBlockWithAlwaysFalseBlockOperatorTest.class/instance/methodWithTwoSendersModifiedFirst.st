accessing
methodWithTwoSendersModifiedFirst
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | false] 
		ifNone: [0]