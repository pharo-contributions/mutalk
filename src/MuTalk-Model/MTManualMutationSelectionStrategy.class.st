"
This strategy uses a fixed list of mutations pre-computed by the user
"
Class {
	#name : #MTManualMutationSelectionStrategy,
	#superclass : #MTMutantSelectionStrategy,
	#instVars : [
		'mutations'
	],
	#category : 'MuTalk-Model-Mutant selection strategies'
}

{ #category : #'instance creation' }
MTManualMutationSelectionStrategy class >> with: aCollection [

	^ self new
		mutations: aCollection;
		yourself
]

{ #category : #accessing }
MTManualMutationSelectionStrategy >> mutations: anInfiniteReadStream [ 
	mutations := anInfiniteReadStream
]

{ #category : #accessing }
MTManualMutationSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	"Do not compute a list of mutations, just use the explicit one"
	^ mutations
]
