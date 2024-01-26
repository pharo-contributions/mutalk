Class {
	#name : 'MTAuxiliarClassForMutantOperatorAnalysis',
	#superclass : 'Object',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'as yet unclassified' }
MTAuxiliarClassForMutantOperatorAnalysis >> methodA [

	| result |
	result := 1 + 1.
	^ result
]

{ #category : 'as yet unclassified' }
MTAuxiliarClassForMutantOperatorAnalysis >> methodB [

	false ifFalse: [ ^ 1 ]
]
