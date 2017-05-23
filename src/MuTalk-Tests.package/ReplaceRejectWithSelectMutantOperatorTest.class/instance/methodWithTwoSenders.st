accessing
methodWithTwoSenders
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]