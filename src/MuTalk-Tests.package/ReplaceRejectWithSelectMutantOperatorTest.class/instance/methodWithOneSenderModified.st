accessing
methodWithOneSenderModified
	^OrderedCollection new 
		select: [:element | element notNil]