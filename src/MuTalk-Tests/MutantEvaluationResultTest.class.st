Class {
	#name : #MutantEvaluationResultTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MutantEvaluationResultTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : #accessing }
MutantEvaluationResultTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : #'testing - printing' }
MutantEvaluationResultTest >> mutantPrintString [
	"printing the mutation used in this tests."
	^ resource mutation printString
]

{ #category : #testing }
MutantEvaluationResultTest >> setUp [
	resource := MutationTestingResource current
]

{ #category : #testing }
MutantEvaluationResultTest >> testMutationResultEmpty [
	"Test the creation of a Mutant Result Empty."
	| result |
	result := resource evaluationResultEmpty.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 0
]

{ #category : #testing }
MutantEvaluationResultTest >> testMutationResultKilledByError [
	| result |
	result := resource evaluationResultForKilledMutantByError.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : #testing }
MutantEvaluationResultTest >> testMutationResultKilledByFailure [
	| result |
	result := resource evaluationResultForKilledMutantByFailure.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : #testing }
MutantEvaluationResultTest >> testMutationResultSurvived [
	"Test the creation of a Mutant Result that survived"
	| result |
	result := resource evaluationResultForAliveMutant.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : #testing }
MutantEvaluationResultTest >> testMutationResultTerminated [
	| result |
	result := resource evaluationResultForTerminatedMutant.
	self deny: result killed.
	self deny: result survived.
	self assert: result terminated.
	self assert: result runCount = 0
]

{ #category : #'testing - printing' }
MutantEvaluationResultTest >> testPrintingMutationResultEmpty [
	"printing a mutation result empty."
	| result stream |
	result := resource evaluationResultEmpty.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : #'testing - printing' }
MutantEvaluationResultTest >> testPrintingMutationResultKilledByError [
	"printing a mutation result killed by error."
	| result stream |
	result := resource evaluationResultForKilledMutantByError.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : #'testing - printing' }
MutantEvaluationResultTest >> testPrintingMutationResultKilledByFailure [
	"printing a mutation result killed by failure."
	| result stream |
	result := resource evaluationResultForKilledMutantByFailure.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : #'testing - printing' }
MutantEvaluationResultTest >> testPrintingMutationResultSurvived [
	"printing a mutation result alive."
	| result stream |
	result := resource evaluationResultForAliveMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : #'testing - printing' }
MutantEvaluationResultTest >> testPrintingMutationResultTerminated [
	"printing a mutation result terminated."
	| result stream |
	result := resource evaluationResultForTerminatedMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]
