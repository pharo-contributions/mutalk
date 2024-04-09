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
		'testFilter',
		'mutantGenerationStrategy'
	],
	#category : 'MuTalk-Model-Core',
	#package : 'MuTalk-Model',
	#tag : 'Core'
}

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

	^ MTTimeBudget for: 3 * self totalTestsTime
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultLogger [

	^ MTTranscriptLogger new
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultMutantGenerationStrategy [

	^ MTAllMutantGenerationStrategy withRandomOperatorMutantSelection
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultOperators [

	^ MTAbstractMutantOperator contentsAll
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultTestFilter [

	^ MTFreeTestFilter new
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultTestSelectionStrategy [

	^ MTSelectingFromCoverageTestSelectionStrategy new
]

{ #category : 'accessing' }
MTAnalysis >> doNotStopOnErrorOrFail [

	stopOnErrorOrFail := false
]

{ #category : 'results' }
MTAnalysis >> generalResult [

	^ MTGeneralResult
		  for: mutantResults
		  timed: elapsedTime
		  excludedTests: testFilter excludedTests
]

{ #category : 'running' }
MTAnalysis >> generateCoverageAnalysis [

	logger logStartCoverageAnalysis.
	coverageAnalysisResult := (MTCoverageAnalysis
		                           for: self modelClasses
		                           running: testCases)
		                          run;
		                          result
]

{ #category : 'running' }
MTAnalysis >> generateMutations [

	logger logStartMutationGeneration.
	^ mutations ifNil: [
		  mutations := mutantGenerationStrategy
			               mutationsFor: self
			               loggingIn: logger.
		  logger logTotalNumberOfMutations: mutations.
		  mutations ]
]

{ #category : 'running' }
MTAnalysis >> generateResults [

	mutantResults := OrderedCollection new.
	logger logStartMutationEvaluation.

	mutations do: [ :aMutation |
		(budget exceedsBudgetOn: mutantResults fromTotalMutations: mutations)
			ifTrue: [ ^ mutantResults ].
		logger logStartEvaluating: aMutation.
		mutantResults add: ((MTMutantEvaluation
				  for: aMutation
				  using: testCases
				  following: testSelectionStrategy
				  andConsidering: self coverageAnalysisResult)
				 valueStoppingOnError: stopOnErrorOrFail) ].
	logger logEnd.
	^ mutantResults
]

{ #category : 'running' }
MTAnalysis >> initialTestRun [
	"Runs all tests once and filters them"

	| results |
	results := testCases collect: [ :aTestCase | aTestCase run ].
	testFilter validateFailuresIn: results.
	testCases := testFilter filterTests: testCases
]

{ #category : 'initialization' }
MTAnalysis >> initialize [

	super initialize.
	operators := self defaultOperators.
	mutantGenerationStrategy := self defaultMutantGenerationStrategy.
	testSelectionStrategy := self defaultTestSelectionStrategy.
	mutantResults := OrderedCollection new.
	elapsedTime := 0.
	logger := self defaultLogger.
	testFilter := self defaultTestFilter.
	stopOnErrorOrFail := true
]

{ #category : 'accessing' }
MTAnalysis >> logger [

	^ logger
]

{ #category : 'accessing' }
MTAnalysis >> logger: anObject [

	testCases do: [ :testCaseReference |
		testCaseReference logger: anObject ].
	logger := anObject
]

{ #category : 'accessing' }
MTAnalysis >> modelClasses [
	"Filter tests and testsResources"

	^ modelClasses reject: [ :class |
		  self testBaseClasses anySatisfy: [ :classToFilter |
			  class includesBehavior: classToFilter ] ]
]

{ #category : 'accessing' }
MTAnalysis >> mutantGenerationStrategy [

	^ mutantGenerationStrategy
]

{ #category : 'accessing' }
MTAnalysis >> mutantGenerationStrategy: anObject [

	mutantGenerationStrategy := anObject
]

{ #category : 'results' }
MTAnalysis >> mutantResults [

	^ mutantResults
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

{ #category : 'accessing' }
MTAnalysis >> packagesToMutate: aCollectionOfPackages [

	modelClasses := aCollectionOfPackages flatCollect: [ :packageName |
		                packageName asPackage definedClasses ]
]

{ #category : 'running' }
MTAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	^ [
	  self initialTestRun.
	  self startBudget.
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
			  false ]
]

{ #category : 'starting' }
MTAnalysis >> startBudget [

	budget ifNil: [ budget := self defaultBudget ].
	budget start
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

	^ testClass buildSuite tests collect: [ :each |
		  MTTestCaseReference for: each logger: logger ]
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
MTAnalysis >> testPackages: aCollectionOfPackages [

	| testClasses |
	testClasses := aCollectionOfPackages flatCollect: [ :packageName |
		               packageName asPackage definedClasses select:
			               #isTestCase ].
	self testClasses: testClasses
]

{ #category : 'accessing' }
MTAnalysis >> testSelectionStrategy [

	^ testSelectionStrategy
]

{ #category : 'accessing' }
MTAnalysis >> testSelectionStrategy: anObject [

	testSelectionStrategy := anObject
]

{ #category : 'accessing' }
MTAnalysis >> totalTestsTime [

	| times |
	times := testCases collect: #lastTimeToRun.
	^ times reduce: [ :t1 :t2 | t1 + t2 ]
]
