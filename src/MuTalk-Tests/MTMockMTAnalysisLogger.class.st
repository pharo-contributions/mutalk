Class {
	#name : 'MTMockMTAnalysisLogger',
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
MTMockMTAnalysisLogger class >> new [
	^super new initialize.
]

{ #category : 'initialization' }
MTMockMTAnalysisLogger >> initialize [ 
	loggedStartAnalysis := false.
	loggedStartBuildingMutations := OrderedCollection new.
	loggedEvaluationMutations := OrderedCollection new.
]

{ #category : 'logging' }
MTMockMTAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	loggedStartAnalysis := true.
]

{ #category : 'logging' }
MTMockMTAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	loggedStartBuildingMutations add:(Array with:aCompiledMethod with: aMutantOperator ). 

	
]

{ #category : 'logging' }
MTMockMTAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	loggedEvaluationMutations add: aMethodMutation.
]

{ #category : 'testing' }
MTMockMTAnalysisLogger >> loggedStartAnalysis [
	^loggedStartAnalysis
]

{ #category : 'testing' }
MTMockMTAnalysisLogger >> loggedStartBuildingMutationsFor: aCompiledMethod using: aMutantOperator [
	^loggedStartBuildingMutations anySatisfy:[:array | (array at:1 ) = aCompiledMethod and:[(array at:2) = aMutantOperator ]]  
	
]

{ #category : 'testing' }
MTMockMTAnalysisLogger >> loggedStartMutantEvaluationForMutationOf: aCompiledMethod [ 
	^ loggedEvaluationMutations
		anySatisfy: [:aMutation | aMutation originalMethod = aCompiledMethod]
]
