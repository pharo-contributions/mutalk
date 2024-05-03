Class {
	#name : 'MTAnalysis',
	#superclass : 'Object',
	#instVars : [
		'methodsToMutate',
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
MTAnalysis >> classesToMutate: aClassCollection [

	methodsToMutate := aClassCollection flatCollect: [ :class |
		                   | methods |
		                   methods := class package methodsForClass: class.
		                   methods addAll:
			                   (class package methodsForClass: class class).
		                   methods ]
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

	^ MTTimeBudget for: 5 minutes
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

	^ MTAbstractMutantOperator contents
]

{ #category : 'accessing - defaults' }
MTAnalysis >> defaultTestFilter [

	| times |
	times := testCases collect: #lastTimeToRun.
	(times anySatisfy: #isNil) ifTrue: [
		^ Error signal:
			  'Either there is no test cases, or the initial test run has not been executed yet' ].
	^ MTCompositeTestFilter for: {
			  MTRedTestFilter new.
			  (MTTimeTestFilter for: (self percentile: 90 for: times sorted)) }
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
		                           for: methodsToMutate
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

	testCases do: [ :aTestCase | aTestCase run ].

	"The test filter is initialized lazily here because the default one needs the run time of tests, so the initial test run must be executed first"
	testCases := self testFilter filterTests: testCases.
	(testCases anySatisfy: [ :testCase |
		 self testFilter failuresOrErrorsIn: testCase ]) ifTrue: [
		MTTestsWithErrorsException signal ]
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
	stopOnErrorOrFail := true.
	budget := self defaultBudget
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
MTAnalysis >> methodsToMutate [

	^ methodsToMutate
]

{ #category : 'accessing' }
MTAnalysis >> methodsToMutate: anObject [

	methodsToMutate := anObject
]

{ #category : 'accessing' }
MTAnalysis >> modelClasses [

	| classes |
	classes := methodsToMutate collect: #methodClass.
	^ classes copyWithoutDuplicates
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

{ #category : 'initialization' }
MTAnalysis >> noLimitations [

	budget := MTFreeBudget new.
	testFilter := MTFreeTestFilter new
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

	methodsToMutate := aCollectionOfPackages flatCollect: [ :packageName |
		                   packageName asPackage methods ]
]

{ #category : 'computing' }
MTAnalysis >> percentile: aPercentage for: aCollection [

	| size index |
	aCollection isEmpty ifTrue: [
		^ CollectionIsEmpty signalWith: aCollection ].
	size := aCollection size.
	index := (aPercentage percent * size) rounded.
	^ aCollection at: index
]

{ #category : 'running' }
MTAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	self initialTestRun.
	
	"The budget is started after the initial test run because the default one needs the run time of tests"
	budget start.
	logger logAnalysisStartFor: self.
	
	elapsedTime := [
		self generateCoverageAnalysis.
		self generateMutations.
		self generateResults ] timeToRun
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

	| tests |
	tests := aClassCollection
		         inject: OrderedCollection new
		         into: [ :testCase :testClass |
			         testClass isAbstract ifFalse: [
				         testCase addAll:
					         (self testCasesReferencesFrom: testClass) ].
			         testCase ].
	tests isEmpty ifTrue: [
		Warning signal: 'There is currently no tests' ].
	^ tests
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

	^ testFilter ifNil: [ testFilter := self defaultTestFilter ]
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
	(times anySatisfy: #isNil) ifTrue: [
		^ Error signal: 'The initial test run has not been executed yet' ].
	^ times reduce: [ :t1 :t2 | t1 + t2 ]
]
