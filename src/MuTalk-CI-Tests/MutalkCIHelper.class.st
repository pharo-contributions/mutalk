Class {
	#name : #MutalkCIHelper,
	#superclass : #Object,
	#instVars : [
		'myRandom',
		'myObject',
		'myLiteral'
	],
	#category : #'MuTalk-CI-Tests'
}

{ #category : #initialization }
MutalkCIHelper >> initialize [

	myRandom := UUID new asString.
	myObject := (10 @ 20)
]

{ #category : #'as yet unclassified' }
MutalkCIHelper >> moveX [

	myObject setX: myObject x + 1 setY: myObject y
]

{ #category : #accessing }
MutalkCIHelper >> myLiteral [

	^ myLiteral
]

{ #category : #accessing }
MutalkCIHelper >> myLiteral: anObject [

	myLiteral := anObject
]

{ #category : #accessing }
MutalkCIHelper >> myObject [

	^ myObject
]

{ #category : #accessing }
MutalkCIHelper >> myObject: anObject [

	myObject := anObject
]

{ #category : #accessing }
MutalkCIHelper >> myRandom [

	^ myRandom
]

{ #category : #accessing }
MutalkCIHelper >> myRandom: anObject [

	myRandom := anObject
]
