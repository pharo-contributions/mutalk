Class {
	#name : 'MTSelectingFromAlivesMutantSelectionStrategy',
	#superclass : 'MTMutantSelectionStrategy',
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTSelectingFromAlivesMutantSelectionStrategy >> analysis: anObject [

	analysis := anObject
]

{ #category : 'generating' }
MTSelectingFromAlivesMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ (analysis generalResult aliveMutants collect: [ :alive | 
		   alive mutant originalMethod ]) asSet 
]
