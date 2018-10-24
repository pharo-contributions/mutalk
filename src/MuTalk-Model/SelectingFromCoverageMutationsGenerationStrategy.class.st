Class {
	#name : #SelectingFromCoverageMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#category : 'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
SelectingFromCoverageMutationsGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [
	^aMutationTestingAnalysis coverageAnalysisResult coveredMethods.
]
