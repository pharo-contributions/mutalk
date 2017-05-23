accessing
methodWithTwoSendersModifiedFirst
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]