Class {
	#name : 'MTSelectingFromCoverageMutantGenerationStrategy',
	#superclass : 'MTMutantGenerationStrategy',
	#category : 'MuTalk-Model-Mutant generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant generation strategies'
}

{ #category : 'generating' }
MTSelectingFromCoverageMutantGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [
	^aMutationTestingAnalysis coverageAnalysisResult coveredMethods.
]
