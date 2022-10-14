Class {
	#name : #FakeInfiniteRecursion,
	#superclass : #Object,
	#category : #'MuTalk-Tests'
}

{ #category : #'as yet unclassified' }
FakeInfiniteRecursion >> factorial: anInt [
	anInt = 1 ifTrue: [ ^ 1 ].
	
	^ anInt * (self factorial: anInt -1)
]
