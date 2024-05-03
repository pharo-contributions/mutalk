Class {
	#name : 'MTMockAnalysisLogger',
	#superclass : 'MTAnalysisLogger',
	#instVars : [
		'loggedStartAnalysis',
		'loggedStartBuildingMutations',
		'loggedEvaluationMutations'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'initialization' }
MTMockAnalysisLogger >> initialize [ 
	loggedStartAnalysis := false.
	loggedStartBuildingMutations := OrderedCollection new.
	loggedEvaluationMutations := OrderedCollection new.
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logAnalysisStart [ 
	loggedStartAnalysis := true.
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logEnd [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logEndCoverageAnalysis [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logEndEvaluating [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logEndInitialTestRun [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logEndMutationEvaluation [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logEndMutationGeneration [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logNumberOfGeneratedMutations: aNumber [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logRunningTest: aTestCaseReference [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	loggedStartBuildingMutations add:(Array with:aCompiledMethod with: aMutantOperator ). 

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartCoverageAnalysis [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartCoverageAnalysis: testSize [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	loggedEvaluationMutations add: aMethodMutation.
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartEvaluating: aMethodMutation with: testSize [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartInitialTestRun: testSize [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartMutationEvaluation [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartMutationEvaluation: mutantSize [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartMutationGeneration [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartMutationGeneration: methodSize [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logTotalNumberOfMutations: mutations [

	
]

{ #category : 'testing' }
MTMockAnalysisLogger >> loggedStartAnalysis [
	^loggedStartAnalysis
]

{ #category : 'testing' }
MTMockAnalysisLogger >> loggedStartBuildingMutationsFor: aCompiledMethod using: aMutantOperator [
	^loggedStartBuildingMutations anySatisfy:[:array | (array at:1 ) = aCompiledMethod and:[(array at:2) = aMutantOperator ]]  
	
]

{ #category : 'testing' }
MTMockAnalysisLogger >> loggedStartMutantEvaluationForMutationOf: aCompiledMethod [ 
	^ loggedEvaluationMutations
		anySatisfy: [:aMutation | aMutation originalMethod = aCompiledMethod]
]
