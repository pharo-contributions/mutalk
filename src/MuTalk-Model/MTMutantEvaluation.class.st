Class {
	#name : 'MTMutantEvaluation',
	#superclass : 'Object',
	#instVars : [
		'mutation',
		'strategy',
		'testCases',
		'coverageAnalysisResult'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MTMutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy [ 
	^self for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering:nil  
]

{ #category : 'instance creation' }
MTMutantEvaluation class >> for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy and: aTestSelectionStrategy [ 
	|tests|
	tests := aTestSelectionStrategy testCasesFromReferencies: aCollectionOftestCases.
	^self for: aMutation using: tests following: aMutantEvaluationStrategy andConsidering:nil
]

{ #category : 'instance creation' }
MTMutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [ 
	^self new initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult
]

{ #category : 'accessing' }
MTMutantEvaluation >> coverageAnalysisResult [

	^coverageAnalysisResult 
]

{ #category : 'initialize-release' }
MTMutantEvaluation >> initializeCoverageResultIfNil [
	coverageAnalysisResult 
		ifNil:[ |coverageAnalysis|
				coverageAnalysis := MTCoverageAnalysis for: (OrderedCollection with: mutation originalClass)
															 running: testCases. 
				coverageAnalysisResult := coverageAnalysis run;result].
]

{ #category : 'initialize-release' }
MTMutantEvaluation >> initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [
	mutation := aMutation.
	testCases := aCollectionOftestCases.
	strategy := aMutantEvaluationStrategy.
	coverageAnalysisResult := aCoverageAnalysisResult	
]

{ #category : 'private' }
MTMutantEvaluation >> runTests [

	^ mutation runMutant
]

{ #category : 'accessing' }
MTMutantEvaluation >> strategy [
	^strategy
]

{ #category : 'accessing' }
MTMutantEvaluation >> testCases [
	^testCases
]

{ #category : 'private' }
MTMutantEvaluation >> testResults [ 

	^ [ self runTests ] valueWithin: (strategy timeoutForTestsOf: self) milliSeconds onTimeout: [ nil ]
]

{ #category : 'evaluation' }
MTMutantEvaluation >> valueStoppingOnError: aBoolean [

	| testResults |
	self initializeCoverageResultIfNil.

	mutation testCaseReferences:
		(strategy testCasesToEvaluate: mutation for: self).
	testResults := mutation runMutantStoppingOnError: aBoolean.
	^ MTMutantEvaluationResult
		  for: mutation
		  results: testResults
		  producedBy: self
]
