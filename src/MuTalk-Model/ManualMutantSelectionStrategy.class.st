Class {
	#name : #ManualMutantSelectionStrategy,
	#superclass : #MutantSelectionStrategy,
	#instVars : [
		'targetMethods'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
ManualMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : #accessing }
ManualMutantSelectionStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
