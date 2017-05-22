filtering
filterClassFrom: aList
	| pattern |

	pattern := UIManager default chooseFrom: aList asArray message: 'Filter test from:'.
	^(pattern isNil
			or: [pattern = 0])
		ifTrue: [nil]
		ifFalse: [aList at: pattern].