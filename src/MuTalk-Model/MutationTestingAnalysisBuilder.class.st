Class {
	#name : 'MutationTestingAnalysisBuilder',
	#superclass : 'Object',
	#instVars : [
		'modelClasses',
		'operators',
		'testCases',
		'logger',
		'budget',
		'testSelectionStrategy',
		'mutantSelectionStrategy'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> budget: anObject [

	budget := anObject
]

{ #category : 'builder' }
MutationTestingAnalysisBuilder >> buildAnalysis [

	^ MutationTestingAnalysis new
		  initializeFor: testCases
		  mutating: modelClasses
		  using: operators
		  with: testSelectionStrategy
		  with: mutantSelectionStrategy
		  loggingIn: logger
		  budget: budget
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysisBuilder >> defaultBudget [

	^ MTFreeBudget new
]

{ #category : 'defaults' }
MutationTestingAnalysisBuilder >> defaultLogger [

	^ NullMutationTestingAnalysisLogger new
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysisBuilder >> defaultMutantSelectionStrategy [

	^ AllMutantSelectionStrategy new
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysisBuilder >> defaultOperators [

	^ MutantOperator contents
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysisBuilder >> defaultTestSelectionStrategy [

	^ AllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'initialization' }
MutationTestingAnalysisBuilder >> initialize [

	super initialize.
	budget := self defaultBudget.
	logger := self defaultLogger.
	mutantSelectionStrategy := self defaultMutantSelectionStrategy.
	operators := self defaultOperators.
	testSelectionStrategy := self defaultTestSelectionStrategy
]

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> logger: anObject [

	logger := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> modelClasses: anObject [

	modelClasses := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> mutantSelectionStrategy: anObject [

	mutantSelectionStrategy := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> operators: anObject [

	operators := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> testCases: aClassCollection [

	testCases := self testCasesFrom: aClassCollection
]

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> testCasesFrom: aClassCollection [

	^ aClassCollection
		  inject: OrderedCollection new
		  into: [ :testCase :testClass |
			  ((testClass isKindOf: TestCase class) and: [
				   testClass isAbstract not ]) ifTrue: [
				  testCase addAll: (self testCasesReferencesFrom: testClass) ].
			  testCase ]
]

{ #category : 'tests' }
MutationTestingAnalysisBuilder >> testCasesReferencesFrom: testClass [

	^ testClass allTestSelectors collect: [ :each |
		  TestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MutationTestingAnalysisBuilder >> testSelectionStrategy: anObject [

	testSelectionStrategy := anObject
]
