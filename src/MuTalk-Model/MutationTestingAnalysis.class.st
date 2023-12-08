Class {
	#name : 'MutationTestingAnalysis',
	#superclass : 'Object',
	#instVars : [
		'modelClasses',
		'operators',
		'particularResults',
		'elapsedTime',
		'mutantsEvaluationStrategy',
		'mutations',
		'testCases',
		'coverageAnalysisResult',
		'logger',
		'budget',
		'mutationsSelectionStrategy'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultLogger [
	^NullMutationTestingAnalysisLogger new.
]

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultMutantsEvaluationStrategy [
	^ AllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultMutationTestingBudget [

	^ MutationTestingFreeBudget new
]

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultMutationsGenerationStrategy [
	^ AllMutantSelectionStrategy new.
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection [ 	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: self defaultMutantsEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection budget: aBudget [

	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: self defaultMutantsEvaluationStrategy
		  with: self defaultMutationsGenerationStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection loggingIn: aLogger [ 
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: self defaultMutantsEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
		loggingIn: aLogger
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection loggingIn: aLogger budget: aBudget [

	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: self defaultMutantsEvaluationStrategy
		  with: self defaultMutationsGenerationStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy [
	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy budget: aBudget [

	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantEvaluationStrategy
		  with: self defaultMutationsGenerationStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger [
	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
		loggingIn: aLogger
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger budget: aBudget [

	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantEvaluationStrategy
		  with: self defaultMutationsGenerationStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy [ 
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantsEvaluationStrategy
		with: aMutationsGenerationStrategy
		loggingIn: self defaultLogger
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy budget: aBudget [

	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantsEvaluationStrategy
		  with: aMutationsGenerationStrategy
		  loggingIn: self defaultLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger [

	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantsEvaluationStrategy
		  with: aMutationsGenerationStrategy
		  loggingIn: aLogger
		  budget: self defaultMutationTestingBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger budget: aBudget [
	^ self new
		initializeFor: testCases
			mutating: classes
			using: operatorCollection
			with: aMutantsEvaluationStrategy
			with: aMutationsGenerationStrategy
			loggingIn: aLogger
			budget: aBudget;
		yourself
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses [ 
	^ testClasses
		inject: OrderedCollection new
		into: [:testCases :testClass | 
			((testClass isKindOf: TestCase class)
					and: [testClass isAbstract not])
				ifTrue: [testCases
						addAll: (self testCasesReferencesFrom: testClass)].
			testCases]
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection [ 
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection.
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection budget: aBudget [

	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger [ 
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		loggingIn: aLogger
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger budget: aBudget [

	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy [
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy.
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy budget: aBudget [

	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger [
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy 
		loggingIn: aLogger.
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger budget: aBudget [

	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy [
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy
		with: aGenerationStrategy.
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy budget: aBudget [

	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  with: aGenerationStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger [ 
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy
		with: aGenerationStrategy
		loggingIn: aLogger
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger budget: aBudget [

	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  with: aGenerationStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesReferencesFrom: testClass [ 
	^ testClass allTestSelectors collect: 
		[ :each | 
		TestCaseReference 
			for: each
			in: testClass ]
]

{ #category : 'accesing' }
MutationTestingAnalysis >> coverageAnalysisResult [
	
	^coverageAnalysisResult
]

{ #category : 'accessing' }
MutationTestingAnalysis >> coverageAnalysisResult: anObject [

	coverageAnalysisResult := anObject
]

{ #category : 'results' }
MutationTestingAnalysis >> generalResult [
	^ MutationTestingGeneralResult
		for: particularResults
		timed: (Duration nanoSeconds: (Duration milliSeconds: elapsedTime) nanoSeconds)
]

{ #category : 'running' }
MutationTestingAnalysis >> generateCoverageAnalysis [
	coverageAnalysisResult := (CoverageAnalysis for: self modelClasses running: testCases) run; result
]

{ #category : 'running' }
MutationTestingAnalysis >> generateMutations [

	^ mutations ifNil: [
		mutations := mutationsSelectionStrategy
			             mutationsFor: self
			             loggingIn: logger ]
]

{ #category : 'running' }
MutationTestingAnalysis >> generateResults [

	particularResults := OrderedCollection new.
	mutations do: [ :aMutation |
		logger logStartEvaluating: aMutation.
		particularResults add: (MutantEvaluation
				 for: aMutation
				 using: testCases
				 following: mutantsEvaluationStrategy
				 andConsidering: self coverageAnalysisResult) value.
		(budget check: particularResults) ifTrue: [ ^ particularResults ] ].
	^ particularResults
]

{ #category : 'running' }
MutationTestingAnalysis >> initialTestRun [

	"Do an initial run of the tests to check that they are all green.
	Only green tests count for the mutation testing analysis"
	testCases do: [ :aTestCase | aTestCase runChecked ]
]

{ #category : 'initialize-release' }
MutationTestingAnalysis >> initializeFor: someTestCasesReferences mutating: someModelClasses using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger budget: aBudget [

	modelClasses := someModelClasses.
	testCases := someTestCasesReferences.
	operators := operatorCollection.
	mutationsSelectionStrategy := aMutationsGenerationStrategy.
	mutantsEvaluationStrategy := aMutantsEvaluationStrategy.
	particularResults := OrderedCollection new.
	elapsedTime := 0.
	logger := aLogger.
	budget := aBudget
]

{ #category : 'accesing' }
MutationTestingAnalysis >> modelClasses [
	"Filter tests and testsResources"
	^ modelClasses
		reject: [:class | self testBaseClasses
				anySatisfy: [:classToFilter | class includesBehavior: classToFilter]]
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutantsEvaluationStrategy [

	^ mutantsEvaluationStrategy
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutantsEvaluationStrategy: anObject [

	mutantsEvaluationStrategy := anObject
]

{ #category : 'accesing' }
MutationTestingAnalysis >> mutations [
	^mutations
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutations: anObject [

	mutations := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutationsGenerationStrategy [

	^ mutationsSelectionStrategy
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutationsGenerationStrategy: anObject [

	mutationsSelectionStrategy := anObject
]

{ #category : 'accesing' }
MutationTestingAnalysis >> operators [
	^operators 
]

{ #category : 'results' }
MutationTestingAnalysis >> particularResults [
	^ particularResults
]

{ #category : 'running' }
MutationTestingAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"
	^[budget start.
	self initialTestRun.
	logger logAnalysisStartFor:self.
	elapsedTime := Time millisecondsToRun: [
					self generateCoverageAnalysis.
					self generateMutations.
					self generateResults.].
					true]
						on: TestsWithErrorsException
						do: [:ex | 
							self inform: 'Your tests have Errors or Failures. Please correct them.'.
							ex return: false]
]

{ #category : 'accesing' }
MutationTestingAnalysis >> testBaseClasses [

	^OrderedCollection with: TestCase with: TestResource
]

{ #category : 'accesing' }
MutationTestingAnalysis >> testCases [
	^testCases

]

{ #category : 'accessing' }
MutationTestingAnalysis >> testCases: anObject [

	testCases := anObject
]
