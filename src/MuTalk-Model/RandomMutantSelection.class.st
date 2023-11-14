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

{ #category : #accessing }
RandomMutantSelection >> defaultMutationGenerationStrategy [

	^ AllMutationsGenerationStrategy new
]

{ #category : #accessing }
RandomMutantSelection >> initialize [

	super initialize.
	mutationsGenerationStrategy := self defaultMutationGenerationStrategy
]

{ #category : #accessing }
RandomMutantSelection >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : #accessing }
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

{ #category : #accessing }
RandomMutantSelection >> nullLogger [

	^ mutationsGenerationStrategy nullLogger
]

{ #category : #accessing }
RandomMutantSelection >> selectMutantsFrom: aCollection [

	^ self subclassResponsibility
]
