"
This strategy uses a fixed list of mutations pre-computed by the user
"
Class {
	#name : 'MTManualMutationGenerationStrategy',
	#superclass : 'MTMutantGenerationStrategy',
	#instVars : [
		'mutations'
	],
	#category : 'MuTalk-Model-Mutant generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant generation strategies'
}

{ #category : 'instance creation' }
MTManualMutationGenerationStrategy class >> with: aCollection [

	^ self new
		mutations: aCollection;
		yourself
]

{ #category : 'accessing' }
MTManualMutationGenerationStrategy >> mutations: anInfiniteReadStream [ 
	mutations := anInfiniteReadStream
]

{ #category : 'generating' }
MTManualMutationGenerationStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	"Do not compute a list of mutations, just use the explicit one"
	^ mutations
]
