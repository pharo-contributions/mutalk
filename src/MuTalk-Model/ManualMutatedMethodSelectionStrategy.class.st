Class {
	#name : 'ManualMutatedMethodSelectionStrategy',
	#superclass : 'MutantSelectionStrategy',
	#instVars : [
		'targetMethods'
	],
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'generating' }
ManualMutatedMethodSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : 'accessing' }
ManualMutatedMethodSelectionStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
