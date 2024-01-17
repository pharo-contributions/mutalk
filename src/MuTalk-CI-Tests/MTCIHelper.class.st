Class {
	#name : 'MTCIHelper',
	#superclass : 'Object',
	#instVars : [
		'myRandom',
		'myObject',
		'myLiteral'
	],
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'initialization' }
MTCIHelper >> initialize [

	myRandom := UUID new asString.
	myObject := (10 @ 20)
]

{ #category : 'as yet unclassified' }
MTCIHelper >> moveX [

	myObject setX: myObject x + 1 setY: myObject y
]

{ #category : 'accessing' }
MTCIHelper >> myLiteral [

	^ myLiteral
]

{ #category : 'accessing' }
MTCIHelper >> myLiteral: anObject [

	myLiteral := anObject
]

{ #category : 'accessing' }
MTCIHelper >> myObject [

	^ myObject
]

{ #category : 'accessing' }
MTCIHelper >> myObject: anObject [

	myObject := anObject
]

{ #category : 'accessing' }
MTCIHelper >> myRandom [

	^ myRandom
]

{ #category : 'accessing' }
MTCIHelper >> myRandom: anObject [

	myRandom := anObject
]
