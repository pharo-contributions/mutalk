"
This strategy uses a fixed list of mutations pre-computed by the user
"
Class {
	#name : #ManualMutationSelectionStrategy,
	#superclass : #MutantSelectionStrategy,
	#instVars : [
		'mutations'
	],
	#category : #'MuTalk-Model-Mutant selection strategies'
}

{ #category : #'instance creation' }
ManualMutationSelectionStrategy class >> with: aCollection [

	^ self new
		mutations: aCollection;
		yourself
]

{ #category : #accessing }
ManualMutationSelectionStrategy >> mutations: anInfiniteReadStream [ 
	mutations := anInfiniteReadStream
]

{ #category : #accessing }
ManualMutationSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	"Do not compute a list of mutations, just use the explicit one"
	^ mutations
]
