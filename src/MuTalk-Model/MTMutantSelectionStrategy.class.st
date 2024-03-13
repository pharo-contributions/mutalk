Class {
	#name : 'MTMutantSelectionStrategy',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'generating' }
MTMutantSelectionStrategy >> methodsToMutateFrom:aMutationTestingAnalysis [
	self subclassResponsibility.
]

{ #category : 'generating' }
MTMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [ 
	^ self 
		mutationsFor: aMutationTestingAnalysis
		loggingIn: self nullLogger
]

{ #category : 'generating' }
MTMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [ 
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

{ #category : 'generating' }
MTMutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	| parseTree |
	parseTree := aMethod parseTree.
	^ aCollectionOfMutantOperators
		  inject: OrderedCollection new
		  into: [ :mutations :anOperator |
			  aLogger logStartBuildingMutantionsFor: aMethod using: anOperator.
			  (aMethod ignoredMutationOperators includes: anOperator class)
				  ifFalse: [
					  | newMutations |
					  newMutations := anOperator
						                  mutationsFor: aMethod
						                  with: parseTree.
					  aLogger logNumberOfGeneratedMutations: newMutations size.
					  mutations addAll: newMutations ].
			  mutations ]
]

{ #category : 'logging' }
MTMutantSelectionStrategy >> nullLogger [

	^ MTNullLogger new.
]
