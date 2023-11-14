Class {
	#name : #RandomMutantSelection,
	#superclass : #Object,
	#instVars : [
		'mutationsGenerationStrategy'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #'instance creation' }
RandomMutantSelection class >> using: aMutationsGenerationStrategy [

	^ self new mutationsGenerationStrategy: aMutationsGenerationStrategy
]

{ #category : #'accessing-defaults' }
RandomMutantSelection >> defaultMutationGenerationStrategy [

	^ AllMutationsGenerationStrategy new
]

{ #category : #initialization }
RandomMutantSelection >> initialize [

	super initialize.
	mutationsGenerationStrategy := self defaultMutationGenerationStrategy
]

{ #category : #generating }
RandomMutantSelection >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : #generating }
RandomMutantSelection >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := mutationsGenerationStrategy mutationsFor:
		             aMutationTestingAnalysis loggingIn: aLogger.
	^ self selectMutantsFrom: mutations
]

{ #category : #accessing }
RandomMutantSelection >> mutationsGenerationStrategy [

	^ mutationsGenerationStrategy
]

{ #category : #accessing }
RandomMutantSelection >> mutationsGenerationStrategy: aMutationsGenerationStrategy [

	mutationsGenerationStrategy := aMutationsGenerationStrategy
]

{ #category : #logging }
RandomMutantSelection >> nullLogger [

	^ mutationsGenerationStrategy nullLogger
]

{ #category : #accessing }
RandomMutantSelection >> selectMutantsFrom: aCollection [

	^ self subclassResponsibility
]
