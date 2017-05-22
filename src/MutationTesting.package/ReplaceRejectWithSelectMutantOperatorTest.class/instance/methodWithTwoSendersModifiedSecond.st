accessing
methodWithTwoSendersModifiedSecond
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]