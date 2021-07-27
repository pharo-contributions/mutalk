Class {
	#name : #MutantEvaluation,
	#superclass : #Object,
	#instVars : [
		'mutation',
		'strategy',
		'testCases',
		'coverageAnalysisResult'
	],
	#category : 'MuTalk-Model'
}

{ #category : #'instance creation' }
MutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy [ 
	^self for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering:nil  
]

{ #category : #'instance creation' }
MutantEvaluation class >> for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy and: aTestSelectionStrategy [ 
	|tests|
	tests := aTestSelectionStrategy testCasesFromReferencies: aCollectionOftestCases.
	^self for: aMutation using: tests following: aMutantEvaluationStrategy andConsidering:nil
]

{ #category : #'instance creation' }
MutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [ 
	^self new initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult
]

{ #category : #private }
MutantEvaluation >> calculateTestSuite [
	"Collect all suite test and execute them."
	| suite |
	suite := TestSuite named: 'MutationEvaluation'.
	suite addTests: ((strategy	testCasesToEvaluate: mutation
									for: self) collect: [ :each | each testCase ]).
	^ suite
]

{ #category : #accessing }
MutantEvaluation >> coverageAnalysisResult [

	^coverageAnalysisResult 
]

{ #category : #'initialize-release' }
MutantEvaluation >> initializeCoverageResultIfNil [
	coverageAnalysisResult 
		ifNil:[ |coverageAnalysis|
				coverageAnalysis := CoverageAnalysis for: (OrderedCollection with: mutation originalClass)
															 running: testCases. 
				coverageAnalysisResult := coverageAnalysis run;result].
]

{ #category : #'initialize-release' }
MutantEvaluation >> initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [
	mutation := aMutation.
	testCases := aCollectionOftestCases.
	strategy := aMutantEvaluationStrategy.
	coverageAnalysisResult := aCoverageAnalysisResult	
]

{ #category : #private }
MutantEvaluation >> runTests [
	"Collect all suite test and execute them."
	| suite |
	suite := TestSuite named: 'MutationEvaluation'.
	suite addTests: ((strategy	testCasesToEvaluate: mutation
									for: self) collect: [ :each | each testCase ]).
	^ [ suite runStoppingOnFirstFailOrError ] 
		on: Error
		do: [ :ex | nil ]
]

{ #category : #accessing }
MutantEvaluation >> strategy [
	^strategy
]

{ #category : #accessing }
MutantEvaluation >> testCases [
	^testCases
]

{ #category : #private }
MutantEvaluation >> testResults [ 

	^ [ self runTests ] valueWithin: (strategy timeoutForTestsOf: self) milliSeconds onTimeout: [ nil ]
]

{ #category : #evaluation }
MutantEvaluation >> value [
	| testResults |

	Stdio stdout nextPutAll: mutation originalMethod name asString; lf; flush.

	self initializeCoverageResultIfNil.

	mutation testSuite: self calculateTestSuite.
	testResults := mutation runMutant.

	^ MutantEvaluationResult
		for: mutation
		results: testResults
		producedBy: self
]
