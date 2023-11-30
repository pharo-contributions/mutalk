Class {
	#name : #SelectingFromCoverageMutantSelectionStrategy,
	#superclass : #MutantSelectionStrategy,
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
SelectingFromCoverageMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [
	^aMutationTestingAnalysis coverageAnalysisResult coveredMethods.
]
