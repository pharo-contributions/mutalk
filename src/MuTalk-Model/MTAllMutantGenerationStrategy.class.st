Class {
	#name : 'MTAllMutantGenerationStrategy',
	#superclass : 'MTMutantGenerationStrategy',
	#category : 'MuTalk-Model-Mutant generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant generation strategies'
}

{ #category : 'generating' }
MTAllMutantGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ aMutationTestingAnalysis methodsToMutate
]
