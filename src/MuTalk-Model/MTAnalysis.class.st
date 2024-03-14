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

	^ MTAbstractMutantOperator contents
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

	^ MTGeneralResult
		  for: mutantResults
		  timed: elapsedTime
		  excludedTests: testFilter excludedTests
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

	| filteredTests |
	mutantResults := OrderedCollection new.
	filteredTests := testFilter filterTests: testCases.

	mutations do: [ :aMutation |
		(budget exceedsBudgetOn: mutantResults fromTotalMutations: mutations)
			ifTrue: [ ^ mutantResults ].
		logger logStartEvaluating: aMutation.
		mutantResults add: ((MTMutantEvaluation
				  for: aMutation
				  using: filteredTests
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

{ #category : 'accessing' }
MTAnalysis >> packageToMutate: aCollectionOfPackages [

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
			  false ]
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
		  MTTestCaseReference for: each ]
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
