Class {
	#name : 'SelectingFromAlivesMutationsGenerationStrategy',
	#superclass : 'MutantSelectionStrategy',
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
SelectingFromAlivesMutationsGenerationStrategy >> analysis: anObject [

	analysis := anObject
]

{ #category : 'generating' }
SelectingFromAlivesMutationsGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ (analysis generalResult aliveMutants collect: [ :alive | 
		   alive mutant originalMethod ]) asSet 
]
