accessing
methodWithOneSender  
	^OrderedCollection new 
		reject: [:element | element notNil]