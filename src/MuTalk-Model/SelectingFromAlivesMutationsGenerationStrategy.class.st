Class {
	#name : #SelectingFromAlivesMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#instVars : [
		'analysis'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
SelectingFromAlivesMutationsGenerationStrategy >> analysis: anObject [

	analysis := anObject
]

{ #category : #generating }
SelectingFromAlivesMutationsGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ (analysis generalResult aliveMutants collect: [ :alive | 
		   alive mutant originalMethod ]) asSet 
]
