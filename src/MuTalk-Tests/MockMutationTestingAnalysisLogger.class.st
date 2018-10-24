Class {
	#name : #MockMutationTestingAnalysisLogger,
	#superclass : #MutationTestingAnalysisLogger,
	#instVars : [
		'loggedStartAnalysis',
		'loggedStartBuildingMutations',
		'loggedEvaluationMutations'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #'instance creation' }
MockMutationTestingAnalysisLogger class >> new [
	^super new initialize.
]

{ #category : #'initialize-release' }
MockMutationTestingAnalysisLogger >> initialize [ 
	loggedStartAnalysis := false.
	loggedStartBuildingMutations := OrderedCollection new.
	loggedEvaluationMutations := OrderedCollection new.
]

{ #category : #loggin }
MockMutationTestingAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	loggedStartAnalysis := true.
]

{ #category : #loggin }
MockMutationTestingAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	loggedStartBuildingMutations add:(Array with:aCompiledMethod with: aMutantOperator ). 

	
]

{ #category : #logging }
MockMutationTestingAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	loggedEvaluationMutations add: aMethodMutation.
]

{ #category : #testing }
MockMutationTestingAnalysisLogger >> loggedStartAnalysis [
	^loggedStartAnalysis
]

{ #category : #testing }
MockMutationTestingAnalysisLogger >> loggedStartBuildingMutationsFor: aCompiledMethod using: aMutantOperator [
	^loggedStartBuildingMutations anySatisfy:[:array | (array at:1 ) = aCompiledMethod and:[(array at:2) = aMutantOperator ]]  
	
]

{ #category : #testing }
MockMutationTestingAnalysisLogger >> loggedStartMutantEvaluationForMutationOf: aCompiledMethod [ 
	^ loggedEvaluationMutations
		anySatisfy: [:aMutation | aMutation originalMethod = aCompiledMethod]
]
