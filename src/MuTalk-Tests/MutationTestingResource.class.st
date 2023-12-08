Class {
	#name : 'MutationTestingResource',
	#superclass : 'TestResource',
	#instVars : [
		'testResource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'building' }
MutationTestingResource >> evaluationResultEmpty [
	"Build a MutationEvaluationResult empty"
	| mutant testResultEmpty |
	mutant := self mutation.
	testResultEmpty := self testResultEmpty.
	^ MutantEvaluationResult 
		for: mutant
		results: testResultEmpty
]

{ #category : 'building' }
MutationTestingResource >> evaluationResultForAliveMutant [
	"Build a MutationEvaluationResult for aMutant with only one survived"
	| mutation testResultWithoutErrors |
	mutation := self mutation.
	testResultWithoutErrors := self testResultWithoutErrorOrFailure.
	^ MutantEvaluationResult 
		for: mutation
		results: testResultWithoutErrors
]

{ #category : 'building' }
MutationTestingResource >> evaluationResultForKilledMutantByError [
	"Build a MutationEvaluationResult for aMutant with only one Error"
	| mutation testResultWithOneError |
	mutation := self mutation.
	testResultWithOneError := self testResultWithError.
	^ MutantEvaluationResult 
		for: mutation
		results: testResultWithOneError
]

{ #category : 'building' }
MutationTestingResource >> evaluationResultForKilledMutantByFailure [
	"Build a MutationEvaluationResult for aMutant with only one Failure"
	| mutation testResultWithOneFailure |
	mutation := self mutation.
	testResultWithOneFailure := self testResultWithFailure.
	^ MutantEvaluationResult 
		for: mutation
		results: testResultWithOneFailure
]

{ #category : 'building' }
MutationTestingResource >> evaluationResultForTerminatedMutant [
	"Build a MutationEvaluationResult for aMutant terminated"
	| mutation |
	mutation := self mutation.
	^ MutantEvaluationResult 
		for: mutation
		results: nil
]

{ #category : 'building-private' }
MutationTestingResource >> methodForBuildingMutant [
	^1+2
]

{ #category : 'building-private' }
MutationTestingResource >> mutation [
	"Build Mock Object that simulates a Mutant"
	| method |
	method := self class >> #methodForBuildingMutant.
	^ MethodMutation
		for: method
		using: ReplacePlusWithMinusMutantOperator new
		nodeNumber: 1
		ofClass: self class
]

{ #category : 'building' }
MutationTestingResource >> setUp [
	testResource := MutationTestCaseResource new
]

{ #category : 'building-private' }
MutationTestingResource >> testResultEmpty [
	"Build a TestResult empty"
	^ TestResult new
]

{ #category : 'building-private' }
MutationTestingResource >> testResultWithError [
	"Build a TestResult with error"
	| case |
	case := testResource class selector: #error.
	^ case run
]

{ #category : 'building-private' }
MutationTestingResource >> testResultWithFailure [
	"Build a TestResult with failure"
	| case |
	case := testResource class selector: #fail.
	^ case run
]

{ #category : 'building-private' }
MutationTestingResource >> testResultWithoutErrorOrFailure [
	"Build a TestResult without errors or failures"
	| case |
	case := testResource class selector: #pass.
	^ case run
]
