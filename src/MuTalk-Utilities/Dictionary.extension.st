Extension { #name : 'Dictionary' }

{ #category : '*MuTalk-Utilities' }
Dictionary >> addAllWithoutOverwrite: aKeyedCollection [

	aKeyedCollection == self ifFalse: [
		aKeyedCollection associationsDo: [ :assoc |
			self addWithoutOverwrite: assoc ] ].
	^ aKeyedCollection
]

{ #category : '*MuTalk-Utilities' }
Dictionary >> addWithoutOverwrite: anAssociation [

	| index element |
	index := self findElementOrNil: anAssociation key.
	element := array at: index.
	element
		ifNil: [ self atNewIndex: index put: anAssociation ]
		ifNotNil: [ element value: element value + anAssociation value ].
	^ anAssociation
]
