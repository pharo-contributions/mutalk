Class {
	#name : #SelectingFromCoverageMutantSelectionStrategy,
	#superclass : #MutantSelectionStrategy,
	#category : #'MuTalk-Model-Mutant selection strategies'
}

{ #category : #generating }
SelectingFromCoverageMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [
	^aMutationTestingAnalysis coverageAnalysisResult coveredMethods.
]
