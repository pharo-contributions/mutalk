browsing
resultClass
	
	^result tests isEmpty 
		ifTrue: [mutant originalClass] 
		ifFalse: [result tests first class] 