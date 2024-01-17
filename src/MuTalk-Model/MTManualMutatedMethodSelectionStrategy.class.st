Class {
	#name : 'MTManualMutatedMethodSelectionStrategy',
	#superclass : 'MTMutantSelectionStrategy',
	#instVars : [
		'targetMethods'
	],
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'generating' }
MTManualMutatedMethodSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : 'accessing' }
MTManualMutatedMethodSelectionStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
