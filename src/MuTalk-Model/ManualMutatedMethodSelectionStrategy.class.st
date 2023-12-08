Class {
	#name : #ManualMutatedMethodSelectionStrategy,
	#superclass : #MutantSelectionStrategy,
	#instVars : [
		'targetMethods'
	],
	#category : 'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
ManualMutatedMethodSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : #accessing }
ManualMutatedMethodSelectionStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
