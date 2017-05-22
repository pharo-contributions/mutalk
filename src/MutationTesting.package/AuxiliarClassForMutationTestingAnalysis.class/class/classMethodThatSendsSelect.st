auxiliar
classMethodThatSendsSelect
	|collection|
	collection := OrderedCollection with: 1.
	^collection 
		select: [:item | item = 1]