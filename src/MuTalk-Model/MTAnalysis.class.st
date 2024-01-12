Class {
	#name : 'MTAnalysis',
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
MTAnalysis class >> defaultLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ NullMutationTestingAnalysisLogger new
]

{ #category : 'defaults' }
MTAnalysis class >> defaultMutantsEvaluationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ AllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'defaults' }
MTAnalysis class >> defaultMutationTestingBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MTFreeBudget new
]

{ #category : 'defaults' }
MTAnalysis class >> defaultMutationsGenerationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ AllMutantSelectionStrategy new
]

{ #category : 'instance creation' }
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection budget: aBudget [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection loggingIn: aLogger [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection loggingIn: aLogger budget: aBudget [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy budget: aBudget [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger budget: aBudget [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy budget: aBudget [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger [

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
MTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self new
		  testCases: testCases;
		  classesToMutate: classes;
		  operators: operatorCollection;
		  testSelectionStrategy: aMutantsEvaluationStrategy;
		  mutantSelectionStrategy: aMutationsGenerationStrategy;
		  logger: aLogger;
		  budget: aBudget;
		  yourself
]

{ #category : 'instance creation' }
MTAnalysis class >> testCasesFrom: testClasses [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
]

{ #category : 'instance creation' }
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection budget: aBudget [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger budget: aBudget [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy budget: aBudget [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger budget: aBudget [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy budget: aBudget [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger [

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
MTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger budget: aBudget [

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
MTAnalysis class >> testCasesReferencesFrom: testClass [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ testClass allTestSelectors collect: [ :each |
		  TestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MTAnalysis >> budget [

	^ budget
]

{ #category : 'accessing' }
MTAnalysis >> budget: anObject [

	budget := anObject
]

{ #category : 'accessing' }
MTAnalysis >> classesToMutate: anObject [

	modelClasses := anObject
]

{ #category : 'accesing' }
MTAnalysis >> coverageAnalysisResult [
	
	^coverageAnalysisResult
]

{ #category : 'accessing' }
MTAnalysis >> coverageAnalysisResult: anObject [

	coverageAnalysisResult := anObject
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultBudget [

	^ MTFreeBudget new
]

{ #category : 'defaults' }
MTAnalysis >> defaultLogger [

	^ NullMutationTestingAnalysisLogger new
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultMutantSelectionStrategy [

	^ AllMutantSelectionStrategy new
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultOperators [

	^ MutantOperator contents
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultTestSelectionStrategy [

	^ AllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'accessing' }
MTAnalysis >> doNotStopOnErrorOrFail [

	stopOnErrorOrFail := false
]

{ #category : 'results' }
MTAnalysis >> generalResult [

	^ MutationTestingGeneralResult for: mutantResults timed: elapsedTime
]

{ #category : 'running' }
MTAnalysis >> generateCoverageAnalysis [

	coverageAnalysisResult := (CoverageAnalysis
		                           for: self modelClasses
		                           running: testCases)
		                          run;
		                          result
]

{ #category : 'running' }
MTAnalysis >> generateMutations [

	^ mutations ifNil: [
		  mutations := mutantSelectionStrategy
			               mutationsFor: self
			               loggingIn: logger ]
]

{ #category : 'running' }
MTAnalysis >> generateResults [

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
MTAnalysis >> initialTestRun [
	"Do an initial run of the tests to check that they are all green.
	Only green tests count for the mutation testing analysis"

	testCases do: [ :aTestCase | aTestCase runChecked ]
]

{ #category : 'initialization' }
MTAnalysis >> initialize [

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
MTAnalysis >> logger [

	^ logger
]

{ #category : 'accessing' }
MTAnalysis >> logger: anObject [

	logger := anObject
]

{ #category : 'accesing' }
MTAnalysis >> modelClasses [
	"Filter tests and testsResources"
	^ modelClasses
		reject: [:class | self testBaseClasses
				anySatisfy: [:classToFilter | class includesBehavior: classToFilter]]
]

{ #category : 'results' }
MTAnalysis >> mutantResults [

	^ mutantResults
]

{ #category : 'accessing' }
MTAnalysis >> mutantSelectionStrategy [

	^ mutantSelectionStrategy
]

{ #category : 'accessing' }
MTAnalysis >> mutantSelectionStrategy: anObject [

	mutantSelectionStrategy := anObject
]

{ #category : 'accessing' }
MTAnalysis >> mutations [

	^ mutations
]

{ #category : 'accessing' }
MTAnalysis >> mutations: anObject [

	mutations := anObject
]

{ #category : 'accessing' }
MTAnalysis >> operators [

	^ operators
]

{ #category : 'accessing' }
MTAnalysis >> operators: anObject [

	operators := anObject
]

{ #category : 'running' }
MTAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	^ [
	  budget start.
	  self initialTestRun.
	  logger logAnalysisStartFor: self.
	  elapsedTime := [
	                 self generateCoverageAnalysis.
	                 self generateMutations.
	                 self generateResults ] timeToRun.
	  true ]
		  on: TestsWithErrorsException
		  do: [ :ex |
			  self inform:
				  'Your tests have Errors or Failures. Please correct them.'.
			  ex return: false ]
]

{ #category : 'accessing' }
MTAnalysis >> stopOnErrorOrFail: aBoolean [

	stopOnErrorOrFail := aBoolean
]

{ #category : 'accessing' }
MTAnalysis >> testBaseClasses [

	^ OrderedCollection with: TestCase with: TestResource
]

{ #category : 'accessing' }
MTAnalysis >> testCases [

	^ testCases
]

{ #category : 'accessing' }
MTAnalysis >> testCases: anObject [

	testCases := anObject
]

{ #category : 'accessing' }
MTAnalysis >> testCasesFrom: aClassCollection [

	^ aClassCollection
		  inject: OrderedCollection new
		  into: [ :testCase :testClass |
			  testClass isAbstract ifFalse: [
				  testCase addAll: (self testCasesReferencesFrom: testClass) ].
			  testCase ]
]

{ #category : 'tests' }
MTAnalysis >> testCasesReferencesFrom: testClass [

	^ testClass allTestSelectors collect: [ :each |
		  TestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MTAnalysis >> testClasses: aClassCollection [

	testCases := self testCasesFrom: aClassCollection
]

{ #category : 'accessing' }
MTAnalysis >> testSelectionStrategy [

	^ testSelectionStrategy
]

{ #category : 'accessing' }
MTAnalysis >> testSelectionStrategy: anObject [

	testSelectionStrategy := anObject
]
