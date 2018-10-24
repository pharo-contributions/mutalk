Class {
	#name : #AuxiliarClassForMutationTestingAnalysis,
	#superclass : #Object,
	#category : 'MuTalk-TestResources'
}

{ #category : #auxiliar }
AuxiliarClassForMutationTestingAnalysis class >> classMethodThatSendsSelect [
	|collection|
	collection := OrderedCollection with: 1.
	^collection 
		select: [:item | item = 1]
]

{ #category : #auxiliar }
AuxiliarClassForMutationTestingAnalysis >> anotherMethodWithOneIfFalseSender [
	false ifFalse: [^1].
	^2
]

{ #category : #auxiliar }
AuxiliarClassForMutationTestingAnalysis >> methodWithOneIfFalseSender [
	true ifFalse: [^1].
	^2
]

{ #category : #auxiliar }
AuxiliarClassForMutationTestingAnalysis >> methodWithOneIfTrueSender [
	true ifTrue: [ ^ 1 ].
	^ 2
]

{ #category : #auxiliar }
AuxiliarClassForMutationTestingAnalysis >> methodWithOnePlusSender [
	^ 1 + 2
]

{ #category : #auxiliar }
AuxiliarClassForMutationTestingAnalysis >> methodWithTwoMinusSenders [
	^ 1 - 2 - 3
]
