Class {
	#name : #MTSelectingFromCoverageMutantSelectionStrategy,
	#superclass : #MTMutantSelectionStrategy,
	#category : 'MuTalk-Model-Mutant selection strategies'
}

{ #category : #generating }
MTSelectingFromCoverageMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [
	^aMutationTestingAnalysis coverageAnalysisResult coveredMethods.
]
