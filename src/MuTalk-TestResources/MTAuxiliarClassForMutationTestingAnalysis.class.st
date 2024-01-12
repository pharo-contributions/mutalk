Class {
	#name : 'MTAuxiliarClassForMutationTestingAnalysis',
	#superclass : 'Object',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'auxiliar' }
MTAuxiliarClassForMutationTestingAnalysis class >> classMethodThatSendsSelect [
	|collection|
	collection := OrderedCollection with: 1.
	^collection 
		select: [:item | item = 1]
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMutationTestingAnalysis >> anotherMethodWithOneIfFalseSender [
	false ifFalse: [^1].
	^2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMutationTestingAnalysis >> methodWithOneIfFalseSender [
	true ifFalse: [^1].
	^2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMutationTestingAnalysis >> methodWithOneIfTrueSender [
	true ifTrue: [ ^ 1 ].
	^ 2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMutationTestingAnalysis >> methodWithOnePlusSender [
	^ 1 + 2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMutationTestingAnalysis >> methodWithTwoMinusSenders [
	^ 1 - 2 - 3
]
