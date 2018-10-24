Class {
	#name : #MutationsGenerationStrategy,
	#superclass : #Object,
	#category : 'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
MutationsGenerationStrategy >> methodsToMutateFrom:aMutationTestingAnalysis [
	self subclassResponsibility.
]

{ #category : #generating }
MutationsGenerationStrategy >> mutationsFor: aMutationTestingAnalysis [ 
	^ self 
		mutationsFor: aMutationTestingAnalysis
		loggingIn: self nullLogger
]

{ #category : #generating }
MutationsGenerationStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [ 
	| mutations |
	mutations := OrderedCollection new.
	(self methodsToMutateFrom: aMutationTestingAnalysis) 
		do: 
			[ :aMethod | 
			mutations addAll: (self 
					mutationsFor: aMethod
					usingAll: aMutationTestingAnalysis operators
					logginIn: aLogger) ]
		displayingProgress: 'Building Mutants'.
	^ mutations
]

{ #category : #generating }
MutationsGenerationStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [ 
	| parseTree |
	parseTree := aMethod parseTree.
	^ aCollectionOfMutantOperators
		inject: OrderedCollection new
		into: [:mutations :anOperator | 
			aLogger logStartBuildingMutantionsFor: aMethod using: anOperator.
			mutations
				addAll: (anOperator mutationsFor: aMethod with: parseTree);
				 yourself]
]

{ #category : #logging }
MutationsGenerationStrategy >> nullLogger [

	^ NullMutationTestingAnalysisLogger new.
]
