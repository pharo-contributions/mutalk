Class {
	#name : #RandomMutantSelectionStrategy,
	#superclass : #Object,
	#instVars : [
		'mutationsGenerationStrategy'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #'instance creation' }
RandomMutantSelectionStrategy class >> using: aMutationsGenerationStrategy [

	^ self new mutationsGenerationStrategy: aMutationsGenerationStrategy
]

{ #category : #'accessing-defaults' }
RandomMutantSelectionStrategy >> defaultMutationGenerationStrategy [

	^ AllMutantSelectionStrategy new
]

{ #category : #initialization }
RandomMutantSelectionStrategy >> initialize [

	super initialize.
	mutationsGenerationStrategy := self defaultMutationGenerationStrategy
]

{ #category : #generating }
RandomMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ mutationsGenerationStrategy methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : #generating }
RandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : #generating }
RandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := mutationsGenerationStrategy mutationsFor:
		             aMutationTestingAnalysis loggingIn: aLogger.
	^ mutations shuffle
]

{ #category : #generating }
RandomMutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ mutationsGenerationStrategy
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : #accessing }
RandomMutantSelectionStrategy >> mutationsGenerationStrategy [

	^ mutationsGenerationStrategy
]

{ #category : #accessing }
RandomMutantSelectionStrategy >> mutationsGenerationStrategy: aMutationsGenerationStrategy [

	mutationsGenerationStrategy := aMutationsGenerationStrategy
]

{ #category : #logging }
RandomMutantSelectionStrategy >> nullLogger [

	^ mutationsGenerationStrategy nullLogger
]
