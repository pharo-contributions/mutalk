accessing
methodWithTwoSenders
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]