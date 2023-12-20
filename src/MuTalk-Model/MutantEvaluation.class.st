Class {
	#name : 'MutantEvaluation',
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
MutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy [ 
	^self for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering:nil  
]

{ #category : 'instance creation' }
MutantEvaluation class >> for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy and: aTestSelectionStrategy [ 
	|tests|
	tests := aTestSelectionStrategy testCasesFromReferencies: aCollectionOftestCases.
	^self for: aMutation using: tests following: aMutantEvaluationStrategy andConsidering:nil
]

{ #category : 'instance creation' }
MutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [ 
	^self new initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult
]

{ #category : 'accessing' }
MutantEvaluation >> coverageAnalysisResult [

	^coverageAnalysisResult 
]

{ #category : 'initialize-release' }
MutantEvaluation >> initializeCoverageResultIfNil [
	coverageAnalysisResult 
		ifNil:[ |coverageAnalysis|
				coverageAnalysis := CoverageAnalysis for: (OrderedCollection with: mutation originalClass)
															 running: testCases. 
				coverageAnalysisResult := coverageAnalysis run;result].
]

{ #category : 'initialize-release' }
MutantEvaluation >> initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [
	mutation := aMutation.
	testCases := aCollectionOftestCases.
	strategy := aMutantEvaluationStrategy.
	coverageAnalysisResult := aCoverageAnalysisResult	
]

{ #category : 'private' }
MutantEvaluation >> runTests [

	^ mutation runMutant
]

{ #category : 'accessing' }
MutantEvaluation >> strategy [
	^strategy
]

{ #category : 'accessing' }
MutantEvaluation >> testCases [
	^testCases
]

{ #category : 'private' }
MutantEvaluation >> testResults [ 

	^ [ self runTests ] valueWithin: (strategy timeoutForTestsOf: self) milliSeconds onTimeout: [ nil ]
]

{ #category : 'evaluation' }
MutantEvaluation >> value [
	| testResults |
	self initializeCoverageResultIfNil.

	mutation testCaseReferences: (strategy testCasesToEvaluate: mutation for: self).
	testResults := mutation runMutant.
	^ MutantEvaluationResult
		for: mutation
		results: testResults
		producedBy: self
]

{ #category : 'evaluation' }
MutantEvaluation >> valueWithoutStoppingOnError [

	| testResults |
	self initializeCoverageResultIfNil.

	mutation testCaseReferences:
		(strategy testCasesToEvaluate: mutation for: self).
	testResults := mutation runMutantWithoutStoppingOnError.
	^ MutantEvaluationResult
		  for: mutation
		  results: testResults
		  producedBy: self
]
