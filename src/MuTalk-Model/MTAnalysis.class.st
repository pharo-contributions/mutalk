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
		'mutantSelectionStrategy',
		'testFilter'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'defaults' }
MTAnalysis class >> defaultLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MTNullAnalysisLogger new
]

{ #category : 'defaults' }
MTAnalysis class >> defaultMutantSelectionStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MTAllMutantSelectionStrategy new
]

{ #category : 'defaults' }
MTAnalysis class >> defaultMutationTestingBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MTFreeBudget new
]

{ #category : 'defaults' }
MTAnalysis class >> defaultTestSelectionStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MTAllTestsMethodsRunningTestSelectionStrategy new
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
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
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
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
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
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
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
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
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
		  with: self defaultMutantSelectionStrategy
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
		  with: self defaultMutantSelectionStrategy
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
		  with: self defaultMutantSelectionStrategy
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
		  with: self defaultMutantSelectionStrategy
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
			  testClass isAbstract ifFalse: [
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
		  MTTestCaseReference for: each in: testClass ]
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

{ #category : 'accessing' }
MTAnalysis >> coverageAnalysisResult [

	^ coverageAnalysisResult
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

	^ MTNullAnalysisLogger new
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultMutantSelectionStrategy [

	^ MTAllMutantSelectionStrategy new
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultOperators [

	^ MTMutantOperator contents
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultTestFilter [

	^ MTFreeTestFilter new
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultTestSelectionStrategy [

	^ MTAllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'accessing' }
MTAnalysis >> doNotStopOnErrorOrFail [

	stopOnErrorOrFail := false
]

{ #category : 'results' }
MTAnalysis >> generalResult [

	^ MTGeneralResult for: mutantResults timed: elapsedTime
]

{ #category : 'running' }
MTAnalysis >> generateCoverageAnalysis [

	coverageAnalysisResult := (MTCoverageAnalysis
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

	| tests |
	mutantResults := OrderedCollection new.
	tests := testFilter filterTests: testCases.

	mutations do: [ :aMutation |
		(budget exceedsBudgetOn: mutantResults fromTotalMutations: mutations)
			ifTrue: [ ^ mutantResults ].
		logger logStartEvaluating: aMutation.
		mutantResults add: ((MTMutantEvaluation
				  for: aMutation
				  using: tests
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
	testFilter := self defaultTestFilter.
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

{ #category : 'accessing' }
MTAnalysis >> modelClasses [
	"Filter tests and testsResources"

	^ modelClasses reject: [ :class |
		  self testBaseClasses anySatisfy: [ :classToFilter |
			  class includesBehavior: classToFilter ] ]
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
		  on: MTTestsWithErrorsException
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
		  MTTestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MTAnalysis >> testClasses: aClassCollection [

	testCases := self testCasesFrom: aClassCollection
]

{ #category : 'accessing' }
MTAnalysis >> testFilter [

	^ testFilter
]

{ #category : 'accessing' }
MTAnalysis >> testFilter: anObject [

	testFilter := anObject
]

{ #category : 'accessing' }
MTAnalysis >> testSelectionStrategy [

	^ testSelectionStrategy
]

{ #category : 'accessing' }
MTAnalysis >> testSelectionStrategy: anObject [

	testSelectionStrategy := anObject
]
