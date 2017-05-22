accessing
methodWithTwoSendersModifiedSecond
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:each | false] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: [0]