Class {
	#name : 'MTManualMutatedMethodGenerationStrategy',
	#superclass : 'MTMutantGenerationStrategy',
	#instVars : [
		'targetMethods'
	],
	#category : 'MuTalk-Model-Mutant generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant generation strategies'
}

{ #category : 'generating' }
MTManualMutatedMethodGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : 'accessing' }
MTManualMutatedMethodGenerationStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
