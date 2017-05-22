accessing
methodWithOneSenderModified
	^OrderedCollection new 
		reject: [:element | element notNil]