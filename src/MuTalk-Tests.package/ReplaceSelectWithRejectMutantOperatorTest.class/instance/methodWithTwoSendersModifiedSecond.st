accessing
methodWithTwoSendersModifiedSecond
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]