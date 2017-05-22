accessing
methodWithOneSender  
	^OrderedCollection new 
		select: [:element | element notNil]