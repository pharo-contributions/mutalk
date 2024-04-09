Class {
	#name : 'MTSelectingFromAlivesMutantGenerationStrategy',
	#superclass : 'MTMutantGenerationStrategy',
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTSelectingFromAlivesMutantGenerationStrategy >> analysis: anObject [

	analysis := anObject
]

{ #category : 'generating' }
MTSelectingFromAlivesMutantGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ (analysis generalResult aliveMutants collect: [ :alive | 
		   alive mutant originalMethod ]) asSet 
]
