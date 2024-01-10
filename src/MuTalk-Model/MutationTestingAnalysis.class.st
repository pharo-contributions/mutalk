Class {
	#name : 'MutationTestingAnalysis',
	#superclass : 'Object',
	#instVars : [
		'modelClasses',
		'operators',
		'elapsedTime',
		'mutations',
		'testCases',
		'coverageAnalysisResult',
		'logger',
		'budget',
		'mutantResults',
		'stopOnErrorOrFail',
		'testSelectionStrategy',
		'mutantSelectionStrategy'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ NullMutationTestingAnalysisLogger new
]

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultMutantsEvaluationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ AllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultMutationTestingBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MTFreeBudget new
]

{ #category : 'defaults' }
MutationTestingAnalysis class >> defaultMutationsGenerationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ AllMutantSelectionStrategy new
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: self defaultMutantsEvaluationStrategy
		  with: self defaultMutationsGenerationStrategy
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantEvaluationStrategy
		  with: self defaultMutationsGenerationStrategy
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ testClasses
		  inject: OrderedCollection new
		  into: [ :testCases :testClass |
			  ((testClass isKindOf: TestCase class) and: [
				   testClass isAbstract not ]) ifTrue: [
				  testCases addAll: (self testCasesReferencesFrom: testClass) ].
			  testCases ]
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  loggingIn: aLogger
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  loggingIn: aLogger
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  with: aGenerationStrategy
]

{ #category : 'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
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

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ testClass allTestSelectors collect: [ :each |
		  TestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MutationTestingAnalysis >> budget [

	^ budget
]

{ #category : 'accessing' }
MutationTestingAnalysis >> budget: anObject [

	budget := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysis >> classesToMutate: anObject [

	modelClasses := anObject
]

{ #category : 'accesing' }
MutationTestingAnalysis >> coverageAnalysisResult [
	
	^coverageAnalysisResult
]

{ #category : 'accessing' }
MutationTestingAnalysis >> coverageAnalysisResult: anObject [

	coverageAnalysisResult := anObject
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysis >> defaultBudget [

	^ MTFreeBudget new
]

{ #category : 'defaults' }
MutationTestingAnalysis >> defaultLogger [

	^ NullMutationTestingAnalysisLogger new
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysis >> defaultMutantSelectionStrategy [

	^ AllMutantSelectionStrategy new
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysis >> defaultOperators [

	^ MutantOperator contents
]

{ #category : 'accessing - defaults' }
MutationTestingAnalysis >> defaultTestSelectionStrategy [

	^ AllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'accessing' }
MutationTestingAnalysis >> doNotStopOnErrorOrFail [

	stopOnErrorOrFail := false
]

{ #category : 'results' }
MutationTestingAnalysis >> generalResult [

	^ MutationTestingGeneralResult
		  for: mutantResults
		  timed: (Duration nanoSeconds:
				   (Duration milliSeconds: elapsedTime) nanoSeconds)
]

{ #category : 'running' }
MutationTestingAnalysis >> generateCoverageAnalysis [

	coverageAnalysisResult := (CoverageAnalysis
		                           for: self modelClasses
		                           running: testCases)
		                          run;
		                          result
]

{ #category : 'running' }
MutationTestingAnalysis >> generateMutations [

	^ mutations ifNil: [
		  mutations := mutantSelectionStrategy
			               mutationsFor: self
			               loggingIn: logger ]
]

{ #category : 'running' }
MutationTestingAnalysis >> generateResults [

	mutantResults := OrderedCollection new.
	mutations do: [ :aMutation |
		(budget exceedsBudgetOn: mutantResults fromTotalMutations: mutations)
			ifTrue: [ ^ mutantResults ].
		logger logStartEvaluating: aMutation.
		mutantResults add: ((MutantEvaluation
				  for: aMutation
				  using: testCases
				  following: testSelectionStrategy
				  andConsidering: self coverageAnalysisResult)
				 valueStoppingOnError: stopOnErrorOrFail) ].
	^ mutantResults
]

{ #category : 'running' }
MutationTestingAnalysis >> initialTestRun [
	"Do an initial run of the tests to check that they are all green.
	Only green tests count for the mutation testing analysis"

	testCases do: [ :aTestCase | aTestCase runChecked ]
]

{ #category : 'initialization' }
MutationTestingAnalysis >> initialize [

	super initialize.
	operators := self defaultOperators.
	mutantSelectionStrategy := self defaultMutantSelectionStrategy.
	testSelectionStrategy := self defaultTestSelectionStrategy.
	mutantResults := OrderedCollection new.
	elapsedTime := 0.
	logger := self defaultLogger.
	budget := self defaultBudget.
	stopOnErrorOrFail := true
]

{ #category : 'accessing' }
MutationTestingAnalysis >> logger [

	^ logger
]

{ #category : 'accessing' }
MutationTestingAnalysis >> logger: anObject [

	logger := anObject
]

{ #category : 'accesing' }
MutationTestingAnalysis >> modelClasses [
	"Filter tests and testsResources"
	^ modelClasses
		reject: [:class | self testBaseClasses
				anySatisfy: [:classToFilter | class includesBehavior: classToFilter]]
]

{ #category : 'results' }
MutationTestingAnalysis >> mutantResults [

	^ mutantResults
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutantSelectionStrategy [

	^ mutantSelectionStrategy
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutantSelectionStrategy: anObject [

	mutantSelectionStrategy := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutations [

	^ mutations
]

{ #category : 'accessing' }
MutationTestingAnalysis >> mutations: anObject [

	mutations := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysis >> operators [

	^ operators
]

{ #category : 'accessing' }
MutationTestingAnalysis >> operators: anObject [

	operators := anObject
]

{ #category : 'running' }
MutationTestingAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	^ [
	  budget start.
	  self initialTestRun.
	  logger logAnalysisStartFor: self.
	  elapsedTime := Time millisecondsToRun: [
		                 self generateCoverageAnalysis.
		                 self generateMutations.
		                 self generateResults ].
	  true ]
		  on: TestsWithErrorsException
		  do: [ :ex |
			  self inform:
				  'Your tests have Errors or Failures. Please correct them.'.
			  ex return: false ]
]

{ #category : 'accessing' }
MutationTestingAnalysis >> stopOnErrorOrFail: aBoolean [

	stopOnErrorOrFail := aBoolean
]

{ #category : 'accessing' }
MutationTestingAnalysis >> testBaseClasses [

	^ OrderedCollection with: TestCase with: TestResource
]

{ #category : 'accessing' }
MutationTestingAnalysis >> testCases [

	^ testCases
]

{ #category : 'accessing' }
MutationTestingAnalysis >> testCases: anObject [

	testCases := anObject
]

{ #category : 'accessing' }
MutationTestingAnalysis >> testCasesFrom: aClassCollection [

	^ aClassCollection
		  inject: OrderedCollection new
		  into: [ :testCase :testClass |
			  testClass isAbstract ifFalse: [
				  testCase addAll: (self testCasesReferencesFrom: testClass) ].
			  testCase ]
]

{ #category : 'tests' }
MutationTestingAnalysis >> testCasesReferencesFrom: testClass [

	^ testClass allTestSelectors collect: [ :each |
		  TestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MutationTestingAnalysis >> testClasses: aClassCollection [

	testCases := self testCasesFrom: aClassCollection
]

{ #category : 'accessing' }
MutationTestingAnalysis >> testSelectionStrategy [

	^ testSelectionStrategy
]

{ #category : 'accessing' }
MutationTestingAnalysis >> testSelectionStrategy: anObject [

	testSelectionStrategy := anObject
]
