Class {
	#name : #RandomOperatorMutantSelectionStrategy,
	#superclass : #Object,
	#instVars : [
		'randomMutantSelection'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #intialization }
RandomOperatorMutantSelectionStrategy class >> fixed: aNumber [

	^ self new randomMutantSelection:
		  (FixedRandomMutantSelectionStrategy new numberOfMutants: aNumber)
]

{ #category : #intialization }
RandomOperatorMutantSelectionStrategy class >> percent: aPercentage [

	^ self new randomMutantSelection:
		  (PercentRandomMutantSelectionStrategy new percentageOfMutants: aPercentage)
]

{ #category : #'accessing-defaults' }
RandomOperatorMutantSelectionStrategy >> defaultMutationGenerationStrategy [

	^ randomMutantSelection defaultMutationGenerationStrategy
]

{ #category : #initialization }
RandomOperatorMutantSelectionStrategy >> initialize [

	randomMutantSelection initialize
]

{ #category : #generating }
RandomOperatorMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ randomMutantSelection methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : #generating }
RandomOperatorMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [

	^ randomMutantSelection mutationsFor: aMutationTestingAnalysis
]

{ #category : #generating }
RandomOperatorMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	^ randomMutantSelection
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: aLogger
]

{ #category : #generating }
RandomOperatorMutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ randomMutantSelection
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : #accessing }
RandomOperatorMutantSelectionStrategy >> mutationsGenerationStrategy [

	^ randomMutantSelection mutationsGenerationStrategy
]

{ #category : #accessing }
RandomOperatorMutantSelectionStrategy >> mutationsGenerationStrategy: aMutationsGenerationStrategy [

	^ randomMutantSelection mutationsGenerationStrategy:
		  aMutationsGenerationStrategy
]

{ #category : #logging }
RandomOperatorMutantSelectionStrategy >> nullLogger [

	^ randomMutantSelection nullLogger
]

{ #category : #accessing }
RandomOperatorMutantSelectionStrategy >> randomMutantSelection [

	^ randomMutantSelection
]

{ #category : #accessing }
RandomOperatorMutantSelectionStrategy >> randomMutantSelection: anObject [

	randomMutantSelection := anObject
]
