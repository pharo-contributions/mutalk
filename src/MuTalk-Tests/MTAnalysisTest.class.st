Class {
	#name : 'MTAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTAnalysisTest class >> classNamesNotUnderTest [
	^ #('MutationBrowser' 'MutationTestRunner' )
]

{ #category : 'accessing' }
MTAnalysisTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MTAnalysisTest >> ifFalseForIfTrueReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the AuxiliarClass. 
	In this case, the operation will be a boolean Replacement (ifFalse for ifTrue)."
	| operator |
	operator := ReplaceIfFalseWithIfTrueMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> ifTrueForIfFalseReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be a boolean Replacement (ifTrue for ifFalse)."
	| operator |
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> minusForPlusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the method in MutationTestingAuxiliarClass. 
	In this case, the operation will be an Arithmetic Replacement (Minus for Plus)."
	| operator |
	operator := ReplaceMinusWithPlusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> plusForMinusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be an Arithmetic
	Replacement (Plus for Minus)."
	| operator |
	operator := ReplacePlusWithMinusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> selectForRejectReplacementMutation [
	| operator |
	operator := ReplaceSelectWithRejectMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'tests' }
MTAnalysisTest >> testDefaultParameters [

	| analysis |
	analysis := MutationTestingAnalysis new.
	self
		assert: (analysis operators collect: [ :op | op species ])
		equals: (MutantOperator contents collect: [ :op | op species ]).
	self
		assert: analysis mutantSelectionStrategy species
		equals: AllMutantSelectionStrategy.
	self
		assert: analysis testSelectionStrategy species
		equals: AllTestsMethodsRunningTestSelectionStrategy.
	self assert: analysis budget species equals: MTFreeBudget
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingInfiniteLoopAnalysis [

	| analysis results mutationResult |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.

	analysis := MutationTestingAnalysis new
		            testClasses: { FakeInfiniteLoopsTest };
		            classesToMutate: { FakeInfiniteLoopForTest };
		            operators: { ReplaceLessOrEqualWithTrueOperator new }.

	analysis run.

	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingInfiniteRecursionAnalysis [

	| analysis results mutationResult |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.

	analysis := MutationTestingAnalysis new
		            testClasses: { FakeInfiniteLoopsTest };
		            classesToMutate: { FakeInfiniteLoopForTest };
		            operators:
			            { ReplaceIfTrueReceiverWithFalseOperator new }.

	analysis run.

	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingSimpleMutation [

	| analysis results generalResult mutationResult |
	analysis := MutationTestingAnalysis new
		            testClasses:
			            (Array with:
					             AuxiliarClassForMutationTestingAnalysisTest);
		            classesToMutate:
			            (Array with: AuxiliarClassForMutationTestingAnalysis);
		            operators: self plusForMinusReplacementMutation.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants equals: 1
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingSimpleMutationForClassMethods [

	| analysis results generalResult mutationResult |
	analysis := MutationTestingAnalysis new
		            testClasses:
			            (Array with:
					             AuxiliarClassForMutationTestingAnalysisTest);
		            classesToMutate:
			            (Array with: AuxiliarClassForMutationTestingAnalysis);
		            operators: self selectForRejectReplacementMutation.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants equals: 1
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingSimpleMutationWhenNotRunnedAnalysis [

	| analysis results generalResult |
	analysis := MutationTestingAnalysis new
		            testClasses:
			            (Array with:
					             AuxiliarClassForMutationTestingAnalysisTest);
		            classesToMutate:
			            (Array with: AuxiliarClassForMutationTestingAnalysis);
		            operators: self plusForMinusReplacementMutation.
	"analysis run."
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results isEmpty.
	self assert: generalResult numberOfEvaluatedMutants equals: 0
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingTwoMutantsFromDiferentMethods [
	"Obtain 2 mutants using ifFalse-->ifTrue replacement in two diferent methods."

	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self ifFalseForIfTrueReplacementMutation.
	analysis := MutationTestingAnalysis new
		            testClasses: Array new;
		            classesToMutate:
			            (Array with: AuxiliarClassForMutationTestingAnalysis);
		            operators: operatorSelection.
	analysis run.
	results := analysis mutantResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingTwoMutantsFromSameMethod [
	"Obtain 2 mutants using --->+ replacement in only one method."

	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self minusForPlusReplacementMutation.
	analysis := MutationTestingAnalysis new
		            testClasses: Array new;
		            classesToMutate:
			            (Array with: AuxiliarClassForMutationTestingAnalysis);
		            operators: operatorSelection.
	analysis run.
	results := analysis mutantResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingTwoMutations [
	"Execute 2 diferent mutations #ifTrue-->#ifFalse: and
	#+-->#-"

	| analysis results generalResult operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self plusForMinusReplacementMutation.
	operatorSelection addAll: self ifTrueForIfFalseReplacementMutation.
	analysis := MutationTestingAnalysis new
		            testClasses:
			            (Array with:
					             AuxiliarClassForMutationTestingAnalysisTest);
		            classesToMutate:
			            (Array with: AuxiliarClassForMutationTestingAnalysis);
		            operators: operatorSelection.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self assert: mutationResult killed ].
	self assert: generalResult numberOfKilledMutants equals: 2
]

{ #category : 'tests' }
MTAnalysisTest >> testRunningAllTests [
	"This test verify that the test evaluation keeps running even after the first error, if specified"

	| analysis |
	analysis := MutationTestingAnalysis new
		            testClasses:
			            { AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail };
		            classesToMutate:
			            { AuxiliarClassForMutationTestingAnalysis };
		            operators: MutantOperator contents.

	analysis doNotStopOnErrorOrFail.
	"In this class, tests fail after a certain of executions"
	AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail reset.
	analysis run.
	"Counting the number of failed test for a mutant"
	self assert:
		analysis generalResult killedMutants first result failures size > 1
]
