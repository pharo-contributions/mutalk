Class {
	#name : 'MTAuxiliarClassForMTAnalysis',
	#superclass : 'Object',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'auxiliar' }
MTAuxiliarClassForMTAnalysis class >> classMethodThatSendsSelect [
	|collection|
	collection := OrderedCollection with: 1.
	^collection 
		select: [:item | item = 1]
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMTAnalysis >> anotherMethodWithOneIfFalseSender [
	false ifFalse: [^1].
	^2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMTAnalysis >> methodWithOneIfFalseSender [
	true ifFalse: [^1].
	^2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMTAnalysis >> methodWithOneIfTrueSender [
	true ifTrue: [ ^ 1 ].
	^ 2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMTAnalysis >> methodWithOnePlusSender [
	^ 1 + 2
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMTAnalysis >> methodWithTwoMinusSenders [
	^ 1 - 2 - 3
]
