Class {
	#name : 'MTMutantGenerationStrategy',
	#superclass : 'Object',
	#instVars : [
		'mutantSelectionStrategy'
	],
	#category : 'MuTalk-Model-Mutant generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant generation strategies'
}

{ #category : 'instance creation' }
MTMutantGenerationStrategy class >> withRandomClassMutantSelection [

	^ self new
		  mutantSelectionStrategy: MTRandomClassMutantSelectionStrategy new;
		  yourself
]

{ #category : 'instance creation' }
MTMutantGenerationStrategy class >> withRandomMethodMutantSelection [

	^ self new
		  mutantSelectionStrategy: MTRandomMethodMutantSelectionStrategy new;
		  yourself
]

{ #category : 'instance creation' }
MTMutantGenerationStrategy class >> withRandomMutantSelection [

	^ self new
		  mutantSelectionStrategy: MTRandomMutantSelectionStrategy new;
		  yourself
]

{ #category : 'instance creation' }
MTMutantGenerationStrategy class >> withRandomOperatorMutantSelection [

	^ self new
		  mutantSelectionStrategy: MTRandomOperatorMutantSelectionStrategy new;
		  yourself
]

{ #category : 'accessing - defaults' }
MTMutantGenerationStrategy >> defaultMutantSelectionStrategy [

	^ MTMutantSelectionStrategy new
]

{ #category : 'initialization' }
MTMutantGenerationStrategy >> initialize [

	super initialize.
	mutantSelectionStrategy := self defaultMutantSelectionStrategy
]

{ #category : 'generating' }
MTMutantGenerationStrategy >> methodsToMutateFrom:aMutationTestingAnalysis [
	self subclassResponsibility.
]

{ #category : 'accessing' }
MTMutantGenerationStrategy >> mutantSelectionStrategy [

	^ mutantSelectionStrategy
]

{ #category : 'accessing' }
MTMutantGenerationStrategy >> mutantSelectionStrategy: anObject [

	mutantSelectionStrategy := anObject
]

{ #category : 'generating' }
MTMutantGenerationStrategy >> mutationsFor: aMutationTestingAnalysis [ 
	^ self 
		mutationsFor: aMutationTestingAnalysis
		loggingIn: self nullLogger
]

{ #category : 'generating' }
MTMutantGenerationStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := OrderedCollection new.
	(self methodsToMutateFrom: aMutationTestingAnalysis)
		do: [ :aMethod |
			mutations addAll: (self
					 mutationsFor: aMethod
					 usingAll: aMutationTestingAnalysis operators
					 logginIn: aLogger) ]
		displayingProgress: 'Building Mutants'.
	^ mutantSelectionStrategy shuffleMutants: mutations
]

{ #category : 'generating' }
MTMutantGenerationStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

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
MTMutantGenerationStrategy >> nullLogger [

	^ MTNullLogger new.
]
