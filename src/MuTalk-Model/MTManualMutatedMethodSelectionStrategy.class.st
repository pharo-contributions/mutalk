Class {
	#name : #MTManualMutatedMethodSelectionStrategy,
	#superclass : #MTMutantSelectionStrategy,
	#instVars : [
		'targetMethods'
	],
	#category : 'MuTalk-Model-Mutant selection strategies'
}

{ #category : #generating }
MTManualMutatedMethodSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : #accessing }
MTManualMutatedMethodSelectionStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
