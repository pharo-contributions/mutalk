accessing
methodWithOneSender  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]