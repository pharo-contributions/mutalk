accessing
methodWithTwoSenders
	^Dictionary new 
		at: 1 
		ifAbsent: [Dictionary new 
						at: 2 
						ifAbsent: [3]]