Class {
	#name : #MutationTestingAnalysis,
	#superclass : #Object,
	#instVars : [
		'modelClasses',
		'operators',
		'particularResults',
		'elapsedTime',
		'mutationsGenerationStrategy',
		'mutantsEvaluationStrategy',
		'mutations',
		'testCases',
		'coverageAnalysisResult',
		'logger'
	],
	#category : #'MuTalk-Model'
}

{ #category : #defaults }
MutationTestingAnalysis class >> defaultLogger [
	^NullMutationTestingAnalysisLogger new.
]

{ #category : #defaults }
MutationTestingAnalysis class >> defaultMutantsEvaluationStrategy [
	^ AllTestsMethodsRunningMutantEvaluationStrategy new
]

{ #category : #defaults }
MutationTestingAnalysis class >> defaultMutationsGenerationStrategy [
	^ AllMutationsGenerationStrategy new.
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection [ 	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: self defaultMutantsEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection loggingIn: aLogger [ 
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: self defaultMutantsEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
		loggingIn: aLogger
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy [
	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger [
	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
		loggingIn: aLogger
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy [ 
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantsEvaluationStrategy
		with: aMutationsGenerationStrategy
		loggingIn: self defaultLogger
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger [ 
	^ self new
		initializeFor: testCases
			mutating: classes
			using: operatorCollection
			with: aMutantsEvaluationStrategy
			with: aMutationsGenerationStrategy
			loggingIn: aLogger;
		yourself
]

{ #category : #'instance creation' }
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

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection [ 
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection.
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger [ 
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		loggingIn: aLogger
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy [
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy.
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger [
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy 
		loggingIn: aLogger.
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy [
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy
		with: aGenerationStrategy.
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger [ 
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy
		with: aGenerationStrategy
		loggingIn: aLogger
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesReferencesFrom: testClass [ 
	^ testClass allTestSelectors collect: 
		[ :each | 
		TestCaseReference 
			for: each
			in: testClass ]
]

{ #category : #accesing }
MutationTestingAnalysis >> coverageAnalysisResult [
	
	^coverageAnalysisResult
]

{ #category : #accessing }
MutationTestingAnalysis >> coverageAnalysisResult: anObject [

	coverageAnalysisResult := anObject
]

{ #category : #results }
MutationTestingAnalysis >> generalResult [
	^ MutationTestingGeneralResult
		for: particularResults
		timed: (Duration nanoSeconds: (Duration milliSeconds: elapsedTime) nanoSeconds)
]

{ #category : #running }
MutationTestingAnalysis >> generateCoverageAnalysis [
	coverageAnalysisResult := (CoverageAnalysis for: self modelClasses running: testCases) run; result
]

{ #category : #running }
MutationTestingAnalysis >> generateMutations [
	mutations := mutationsGenerationStrategy 
		mutationsFor: self
		loggingIn: logger
]

{ #category : #running }
MutationTestingAnalysis >> generateResults [
	particularResults := OrderedCollection new.
	mutations
		do: [:aMutation | logger logStartEvaluating: aMutation. 
			particularResults add: (MutantEvaluation
					for: aMutation
					using: testCases
					following: mutantsEvaluationStrategy
					andConsidering: self coverageAnalysisResult) value]
		displayingProgress:[ :aClass | 
			'Evaluating Mutants: ', particularResults size asString , '/', mutations size asString ].
	^ particularResults
]

{ #category : #running }
MutationTestingAnalysis >> initialTestRun [

	"Do an initial run of the tests to check that they are all green.
	Only green tests count for the mutation testing analysis"
	testCases do: [ :aTestCase | aTestCase runChecked ]
]

{ #category : #'initialize-release' }
MutationTestingAnalysis >> initializeFor: someTestCasesReferences mutating: someModelClasses using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger [ 
	modelClasses := someModelClasses.
	testCases := someTestCasesReferences.
	operators := operatorCollection.
	mutationsGenerationStrategy := aMutationsGenerationStrategy.
	mutantsEvaluationStrategy := aMutantsEvaluationStrategy.
	particularResults := OrderedCollection new.
	elapsedTime := 0.
	logger := aLogger
]

{ #category : #accesing }
MutationTestingAnalysis >> modelClasses [
	"Filter tests and testsResources"
	^ modelClasses
		reject: [:class | self testBaseClasses
				anySatisfy: [:classToFilter | class includesBehavior: classToFilter]]
]

{ #category : #accessing }
MutationTestingAnalysis >> mutantsEvaluationStrategy [

	^ mutantsEvaluationStrategy
]

{ #category : #accessing }
MutationTestingAnalysis >> mutantsEvaluationStrategy: anObject [

	mutantsEvaluationStrategy := anObject
]

{ #category : #accesing }
MutationTestingAnalysis >> mutations [
	^mutations
]

{ #category : #accessing }
MutationTestingAnalysis >> mutations: anObject [

	mutations := anObject
]

{ #category : #accessing }
MutationTestingAnalysis >> mutationsEvaluationStrategy [

	^ mutationsGenerationStrategy
]

{ #category : #accessing }
MutationTestingAnalysis >> mutationsEvaluationStrategy: anObject [

	mutationsGenerationStrategy := anObject
]

{ #category : #accesing }
MutationTestingAnalysis >> operators [
	^operators 
]

{ #category : #results }
MutationTestingAnalysis >> particularResults [
	^ particularResults
]

{ #category : #running }
MutationTestingAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"
	^[self initialTestRun.
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

{ #category : #accesing }
MutationTestingAnalysis >> testBaseClasses [

	^OrderedCollection with: TestCase with: TestResource
]

{ #category : #accesing }
MutationTestingAnalysis >> testCases [
	^testCases

]

{ #category : #accessing }
MutationTestingAnalysis >> testCases: anObject [

	testCases := anObject
]
