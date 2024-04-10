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
	operator := MTReplaceIfFalseWithIfTrueMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> ifTrueForIfFalseReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be a boolean Replacement (ifTrue for ifFalse)."
	| operator |
	operator := MTReplaceIfTrueWithIfFalseMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> minusForPlusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the method in MutationTestingAuxiliarClass. 
	In this case, the operation will be an Arithmetic Replacement (Minus for Plus)."
	| operator |
	operator := MTReplaceMinusWithPlusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> plusForMinusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be an Arithmetic
	Replacement (Plus for Minus)."
	| operator |
	operator := MTReplacePlusWithMinusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MTAnalysisTest >> selectForRejectReplacementMutation [
	| operator |
	operator := MTReplaceSelectWithRejectMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'tests' }
MTAnalysisTest >> testCorrectNumberOfTestCasesWithParametrizedTestCase [

	| analysis |
	analysis := MTAnalysis new
		            testClasses: { MTAuxiliarParametrizedTestClass };
		            classesToMutate: {  }.

	self assert: analysis testCases size equals: 3
]

{ #category : 'tests' }
MTAnalysisTest >> testDefaultParameters [

	| analysis |
	analysis := MTAnalysis new.
	self
		assert: (analysis operators collect: [ :op | op species ])
		equals:
		(MTAbstractMutantOperator contentsAll collect: [ :op | op species ]).
	self
		assert: analysis mutantGenerationStrategy species
		equals: MTAllMutantGenerationStrategy.
	self
		assert: analysis testSelectionStrategy species
		equals: MTSelectingFromCoverageTestSelectionStrategy.
	self assert: analysis budget species equals: MTFreeBudget
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingInfiniteLoopAnalysis [

	| analysis results mutationResult |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.

	analysis := MTAnalysis new
		            testClasses: { MTFakeInfiniteLoopsTest };
		            classesToMutate: { MTFakeInfiniteLoopForTest };
		            operators: { MTReplaceLessOrEqualWithTrueOperator new }.

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

	analysis := MTAnalysis new
		            testClasses: { MTFakeInfiniteLoopsTest };
		            classesToMutate: { MTFakeInfiniteLoopForTest };
		            operators:
			            { MTReplaceIfTrueReceiverWithFalseOperator new }.

	analysis run.

	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed
]

{ #category : 'testing' }
MTAnalysisTest >> testExecutingSimpleMutation [

	| analysis results generalResult mutationResult |
	analysis := MTAnalysis new
		            testClasses:
			            (Array with:
					             MTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MTAuxiliarClassForMTAnalysis);
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
	analysis := MTAnalysis new
		            testClasses:
			            (Array with:
					             MTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MTAuxiliarClassForMTAnalysis);
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
	analysis := MTAnalysis new
		            testClasses:
			            (Array with:
					             MTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MTAuxiliarClassForMTAnalysis);
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
	analysis := MTAnalysis new
		            testClasses: Array new;
		            classesToMutate:
			            (Array with: MTAuxiliarClassForMTAnalysis);
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
	analysis := MTAnalysis new
		            testClasses: Array new;
		            classesToMutate:
			            (Array with: MTAuxiliarClassForMTAnalysis);
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
	analysis := MTAnalysis new
		            testClasses:
			            (Array with:
					             MTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MTAuxiliarClassForMTAnalysis);
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
	analysis := MTAnalysis new
		            testClasses:
			            { MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail };
		            classesToMutate: { MTAuxiliarClassForMTAnalysis };
		            testSelectionStrategy:
			            MTAllTestsMethodsRunningTestSelectionStrategy new;
		            doNotStopOnErrorOrFail.

	"In this class, tests fail after a certain of executions"
	MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail reset.
	analysis run.
	"Counting the number of failed test for a mutant"
	self assert:
		analysis generalResult killedMutants first result failures size > 1
]
