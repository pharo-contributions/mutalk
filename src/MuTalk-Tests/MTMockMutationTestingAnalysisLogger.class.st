Class {
	#name : 'MTMockMutationTestingAnalysisLogger',
	#superclass : 'MTAnalysisLogger',
	#instVars : [
		'loggedStartAnalysis',
		'loggedStartBuildingMutations',
		'loggedEvaluationMutations'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'instance creation' }
MTMockMutationTestingAnalysisLogger class >> new [
	^super new initialize.
]

{ #category : 'initialize-release' }
MTMockMutationTestingAnalysisLogger >> initialize [ 
	loggedStartAnalysis := false.
	loggedStartBuildingMutations := OrderedCollection new.
	loggedEvaluationMutations := OrderedCollection new.
]

{ #category : 'loggin' }
MTMockMutationTestingAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	loggedStartAnalysis := true.
]

{ #category : 'loggin' }
MTMockMutationTestingAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	loggedStartBuildingMutations add:(Array with:aCompiledMethod with: aMutantOperator ). 

	
]

{ #category : 'logging' }
MTMockMutationTestingAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	loggedEvaluationMutations add: aMethodMutation.
]

{ #category : 'testing' }
MTMockMutationTestingAnalysisLogger >> loggedStartAnalysis [
	^loggedStartAnalysis
]

{ #category : 'testing' }
MTMockMutationTestingAnalysisLogger >> loggedStartBuildingMutationsFor: aCompiledMethod using: aMutantOperator [
	^loggedStartBuildingMutations anySatisfy:[:array | (array at:1 ) = aCompiledMethod and:[(array at:2) = aMutantOperator ]]  
	
]

{ #category : 'testing' }
MTMockMutationTestingAnalysisLogger >> loggedStartMutantEvaluationForMutationOf: aCompiledMethod [ 
	^ loggedEvaluationMutations
		anySatisfy: [:aMutation | aMutation originalMethod = aCompiledMethod]
]
