accessing
methodWithOneSenderModified
		^OrderedCollection new 
		detect: [:each | true] 
		ifNone: [true]