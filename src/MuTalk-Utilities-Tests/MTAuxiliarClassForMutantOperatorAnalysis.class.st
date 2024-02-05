Class {
	#name : 'MTAuxiliarClassForMutantOperatorAnalysis',
	#superclass : 'Object',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'auxiliar' }
MTAuxiliarClassForMutantOperatorAnalysis >> methodA [

	| result |
	result := 1 + 1.
	^ result
]

{ #category : 'auxiliar' }
MTAuxiliarClassForMutantOperatorAnalysis >> methodB [

	false ifFalse: [ ^ 1 ]
]
