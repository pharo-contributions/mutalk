Class {
	#name : #MutationTestingAnalysisTest,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MutationTestingAnalysisTest class >> classNamesNotUnderTest [
	^ #('MutationBrowser' 'MutationTestRunner' )
]

{ #category : #accessing }
MutationTestingAnalysisTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : #accessing }
MutationTestingAnalysisTest >> ifFalseForIfTrueReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the AuxiliarClass. 
	In this case, the operation will be a boolean Replacement (ifFalse for ifTrue)."
	| operator |
	operator := ReplaceIfFalseWithIfTrueMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> ifTrueForIfFalseReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be a boolean Replacement (ifTrue for ifFalse)."
	| operator |
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> minusForPlusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the method in MutationTestingAuxiliarClass. 
	In this case, the operation will be an Arithmetic Replacement (Minus for Plus)."
	| operator |
	operator := ReplaceMinusWithPlusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> plusForMinusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be an Arithmetic
	Replacement (Plus for Minus)."
	| operator |
	operator := ReplacePlusWithMinusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> selectForRejectReplacementMutation [
	| operator |
	operator := ReplaceSelectWithRejectMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingSimpleMutation [
	| analysis results generalResult mutationResult |
	analysis := MutationTestingAnalysis 
		testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: self plusForMinusReplacementMutation.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis particularResults.
	self assert: results size = 1.
	mutationResult := results first.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants = 1
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingSimpleMutationForClassMethods [
	| analysis results generalResult mutationResult |
	analysis := MutationTestingAnalysis 
		testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: self selectForRejectReplacementMutation.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis particularResults.
	self assert: results size = 1.
	mutationResult := results first.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants = 1
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingSimpleMutationWhenNotRunnedAnalysis [
	| analysis results generalResult |
	analysis := MutationTestingAnalysis 
		testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: self plusForMinusReplacementMutation.
	"analysis run."
	generalResult := analysis generalResult.
	results := analysis particularResults.
	self assert: results size = 0.
	self assert: generalResult numberOfEvaluatedMutants = 0
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingTwoMutantsFromDiferentMethods [
	"Obtain 2 mutants using ifFalse-->ifTrue replacement in two diferent methods."
	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self ifFalseForIfTrueReplacementMutation.
	analysis := MutationTestingAnalysis 
		testCasesFrom: Array new
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: operatorSelection.
	analysis run.
	results := analysis particularResults.
	self assert: results size = 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingTwoMutantsFromSameMethod [
	"Obtain 2 mutants using --->+ replacement in only one method."
	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self minusForPlusReplacementMutation.
	analysis := MutationTestingAnalysis 
		testCasesFrom: Array new
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: operatorSelection.
	analysis run.
	results := analysis particularResults.
	self assert: results size = 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingTwoMutations [
	"Execute 2 diferent mutations #ifTrue-->#ifFalse: and
	#+-->#-"
	| analysis results generalResult operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self plusForMinusReplacementMutation.
	operatorSelection addAll: self ifTrueForIfFalseReplacementMutation.
	analysis := MutationTestingAnalysis 
		testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: operatorSelection.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis particularResults.
	self assert: results size = 2.
	results do: [ :mutationResult | self assert: mutationResult killed ].
	self assert: generalResult numberOfKilledMutants = 2
]
