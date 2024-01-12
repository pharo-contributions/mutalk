Class {
	#name : 'MTSelectingFromAlivesMutationsGenerationStrategy',
	#superclass : 'MTMutantSelectionStrategy',
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTSelectingFromAlivesMutationsGenerationStrategy >> analysis: anObject [

	analysis := anObject
]

{ #category : 'generating' }
MTSelectingFromAlivesMutationsGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ (analysis generalResult aliveMutants collect: [ :alive | 
		   alive mutant originalMethod ]) asSet 
]
