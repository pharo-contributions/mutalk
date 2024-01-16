Class {
	#name : 'MTRandomMutantSelectionStrategy',
	#superclass : 'Object',
	#instVars : [
		'mutationsGenerationStrategy'
	],
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'instance creation' }
MTRandomMutantSelectionStrategy class >> using: aMutationsGenerationStrategy [

	^ self new
		  mutantSelectionStrategy: aMutationsGenerationStrategy;
		  yourself
]

{ #category : 'accessing-defaults' }
MTRandomMutantSelectionStrategy >> defaultMutantSelectionStrategy [

	^ MTAllMutantSelectionStrategy new
]

{ #category : 'initialization' }
MTRandomMutantSelectionStrategy >> initialize [

	super initialize.
	mutationsGenerationStrategy := self defaultMutantSelectionStrategy
]

{ #category : 'generating' }
MTRandomMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ mutationsGenerationStrategy methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : 'accessing' }
MTRandomMutantSelectionStrategy >> mutantSelectionStrategy [

	^ mutationsGenerationStrategy
]

{ #category : 'accessing' }
MTRandomMutantSelectionStrategy >> mutantSelectionStrategy: aMutationsGenerationStrategy [

	mutationsGenerationStrategy := aMutationsGenerationStrategy
]

{ #category : 'generating' }
MTRandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : 'generating' }
MTRandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := mutationsGenerationStrategy mutationsFor:
		             aMutationTestingAnalysis loggingIn: aLogger.
	^ mutations shuffle
]

{ #category : 'generating' }
MTRandomMutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ mutationsGenerationStrategy
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : 'logging' }
MTRandomMutantSelectionStrategy >> nullLogger [

	^ mutationsGenerationStrategy nullLogger
]
