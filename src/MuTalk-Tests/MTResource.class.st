Class {
	#name : 'MTResource',
	#superclass : 'TestResource',
	#instVars : [
		'testResource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'building' }
MTResource >> evaluationResultEmpty [
	"Build a MutationEvaluationResult empty"
	| mutant testResultEmpty |
	mutant := self mutation.
	testResultEmpty := self testResultEmpty.
	^ MTMutantEvaluationResult 
		for: mutant
		results: testResultEmpty
]

{ #category : 'building' }
MTResource >> evaluationResultForAliveMutant [
	"Build a MutationEvaluationResult for aMutant with only one survived"
	| mutation testResultWithoutErrors |
	mutation := self mutation.
	testResultWithoutErrors := self testResultWithoutErrorOrFailure.
	^ MTMutantEvaluationResult 
		for: mutation
		results: testResultWithoutErrors
]

{ #category : 'building' }
MTResource >> evaluationResultForKilledMutantByError [
	"Build a MutationEvaluationResult for aMutant with only one Error"
	| mutation testResultWithOneError |
	mutation := self mutation.
	testResultWithOneError := self testResultWithError.
	^ MTMutantEvaluationResult 
		for: mutation
		results: testResultWithOneError
]

{ #category : 'building' }
MTResource >> evaluationResultForKilledMutantByFailure [
	"Build a MutationEvaluationResult for aMutant with only one Failure"
	| mutation testResultWithOneFailure |
	mutation := self mutation.
	testResultWithOneFailure := self testResultWithFailure.
	^ MTMutantEvaluationResult 
		for: mutation
		results: testResultWithOneFailure
]

{ #category : 'building' }
MTResource >> evaluationResultForTerminatedMutant [
	"Build a MutationEvaluationResult for aMutant terminated"
	| mutation |
	mutation := self mutation.
	^ MTMutantEvaluationResult 
		for: mutation
		results: nil
]

{ #category : 'building-private' }
MTResource >> methodForBuildingMutant [
	^1+2
]

{ #category : 'building-private' }
MTResource >> mutation [
	"Build Mock Object that simulates a Mutant"
	| method |
	method := self class >> #methodForBuildingMutant.
	^ MTMethodMutation
		for: method
		using: MTReplacePlusWithMinusMutantOperator new
		nodeNumber: 1
		ofClass: self class
]

{ #category : 'running' }
MTResource >> setUp [

	super setUp.
	testResource := MTMutationTestCaseResource new
]

{ #category : 'building-private' }
MTResource >> testResultEmpty [
	"Build a TestResult empty"
	^ TestResult new
]

{ #category : 'building-private' }
MTResource >> testResultWithError [
	"Build a TestResult with error"
	| case |
	case := testResource class selector: #error.
	^ case run
]

{ #category : 'building-private' }
MTResource >> testResultWithFailure [
	"Build a TestResult with failure"
	| case |
	case := testResource class selector: #fail.
	^ case run
]

{ #category : 'building-private' }
MTResource >> testResultWithoutErrorOrFailure [
	"Build a TestResult without errors or failures"
	| case |
	case := testResource class selector: #pass.
	^ case run
]
