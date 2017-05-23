accessing
methodWithTwoSenders
	OrderedCollection new 
		do: [:element | element notNil].
	OrderedCollection new 
		do: [:element | element isNil]