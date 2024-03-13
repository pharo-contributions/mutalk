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
MTMockAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	loggedStartAnalysis := true.
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logEnd [

	
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
MTMockAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	loggedEvaluationMutations add: aMethodMutation.
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartMutationEvaluation [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logStartMutationGeneration [

	
]

{ #category : 'logging' }
MTMockAnalysisLogger >> logTotalNumberOfMutations: aNumber [

	
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
