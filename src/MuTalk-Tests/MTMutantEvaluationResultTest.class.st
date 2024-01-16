Class {
	#name : 'MTMutantEvaluationResultTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTMutantEvaluationResultTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MTMutantEvaluationResultTest class >> resources [
	^ {MTResource}
]

{ #category : 'testing - printing' }
MTMutantEvaluationResultTest >> mutantPrintString [
	"printing the mutation used in this tests."
	^ resource mutation printString
]

{ #category : 'running' }
MTMutantEvaluationResultTest >> setUp [

	super setUp.
	resource := MTResource current
]

{ #category : 'testing' }
MTMutantEvaluationResultTest >> testMutationResultEmpty [
	"Test the creation of a Mutant Result Empty."
	| result |
	result := resource evaluationResultEmpty.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 0
]

{ #category : 'testing' }
MTMutantEvaluationResultTest >> testMutationResultKilledByError [
	| result |
	result := resource evaluationResultForKilledMutantByError.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : 'testing' }
MTMutantEvaluationResultTest >> testMutationResultKilledByFailure [
	| result |
	result := resource evaluationResultForKilledMutantByFailure.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : 'testing' }
MTMutantEvaluationResultTest >> testMutationResultSurvived [
	"Test the creation of a Mutant Result that survived"
	| result |
	result := resource evaluationResultForAliveMutant.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : 'testing' }
MTMutantEvaluationResultTest >> testMutationResultTerminated [
	| result |
	result := resource evaluationResultForTerminatedMutant.
	self deny: result killed.
	self deny: result survived.
	self assert: result terminated.
	self assert: result runCount = 0
]

{ #category : 'testing - printing' }
MTMutantEvaluationResultTest >> testPrintingMutationResultEmpty [
	"printing a mutation result empty."
	| result stream |
	result := resource evaluationResultEmpty.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MTMutantEvaluationResultTest >> testPrintingMutationResultKilledByError [
	"printing a mutation result killed by error."
	| result stream |
	result := resource evaluationResultForKilledMutantByError.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MTMutantEvaluationResultTest >> testPrintingMutationResultKilledByFailure [
	"printing a mutation result killed by failure."
	| result stream |
	result := resource evaluationResultForKilledMutantByFailure.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MTMutantEvaluationResultTest >> testPrintingMutationResultSurvived [
	"printing a mutation result alive."
	| result stream |
	result := resource evaluationResultForAliveMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MTMutantEvaluationResultTest >> testPrintingMutationResultTerminated [
	"printing a mutation result terminated."
	| result stream |
	result := resource evaluationResultForTerminatedMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]
