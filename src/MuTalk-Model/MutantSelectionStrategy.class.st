Class {
	#name : #MutantSelectionStrategy,
	#superclass : #Object,
	#category : #'MuTalk-Model-Mutant selection strategies'
}

{ #category : #generating }
MutantSelectionStrategy >> methodsToMutateFrom:aMutationTestingAnalysis [
	self subclassResponsibility.
]

{ #category : #generating }
MutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [ 
	^ self 
		mutationsFor: aMutationTestingAnalysis
		loggingIn: self nullLogger
]

{ #category : #generating }
MutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [ 
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
MutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [ 
	| parseTree |
	parseTree := aMethod parseTree.
	^ aCollectionOfMutantOperators
		inject: OrderedCollection new
		into: [:mutations :anOperator | 
			aLogger logStartBuildingMutantionsFor: aMethod using: anOperator.
			(aMethod ignoredMutationOperators includes: anOperator class) 
				ifFalse: [ mutations addAll: (anOperator mutationsFor: aMethod with: parseTree) ].
			mutations ]
]

{ #category : #logging }
MutantSelectionStrategy >> nullLogger [

	^ NullMutationTestingAnalysisLogger new.
]
