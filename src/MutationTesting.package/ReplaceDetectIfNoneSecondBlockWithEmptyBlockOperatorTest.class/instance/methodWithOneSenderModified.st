accessing
methodWithOneSenderModified
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: []