Class {
	#name : #SelectingFromAlivesMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#instVars : [
		'analysis'
	],
	#category : #'MuTalk-CI'
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
