accessing
methodWithOneSenderModified
		^OrderedCollection new 
		detect: [:each | false] 
		ifNone: [true]