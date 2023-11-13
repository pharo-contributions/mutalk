Class {
	#name : #RandomMutantsEvaluationStrategy,
	#superclass : #Object,
	#instVars : [
		'mutationsEvaluationStrategy'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #'instance creation' }
RandomMutantsEvaluationStrategy class >> using: aMutationsGenerationStrategy [

	^ self new mutationsEvaluationStrategy: aMutationsGenerationStrategy
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> defaultMutationGenerationStrategy [

	^ AllMutationsGenerationStrategy new
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> initialize [

	super initialize.
	mutationsEvaluationStrategy := self defaultMutationGenerationStrategy
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> mutationsEvaluationStrategy [

	^ mutationsEvaluationStrategy
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> mutationsEvaluationStrategy: aMutationsEvaluationStrategy [

	mutationsEvaluationStrategy := aMutationsEvaluationStrategy
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := mutationsEvaluationStrategy mutationsFor:
		             aMutationTestingAnalysis loggingIn: aLogger.
	^ self selectMutantsFrom: mutations
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> nullLogger [

	^ mutationsEvaluationStrategy nullLogger
]

{ #category : #accessing }
RandomMutantsEvaluationStrategy >> selectMutantsFrom: aCollection [

	^ self subclassResponsibility
]
