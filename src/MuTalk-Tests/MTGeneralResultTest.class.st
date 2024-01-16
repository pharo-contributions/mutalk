Class {
	#name : 'MTGeneralResultTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTGeneralResultTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MTGeneralResultTest class >> resources [
	^ {MTResource}
]

{ #category : 'accessing' }
MTGeneralResultTest >> mutationEngineGeneralEmptyResult [
	"Returns an empty Mutant Engine General Result."

	^ MTGeneralResult empty
]

{ #category : 'accessing' }
MTGeneralResultTest >> mutationEngineGeneralResultWithOneAliveMutant [
	"Returns a Mutant Engine General Result with only one mutant survived."

	^ MTGeneralResult for:
		  (OrderedCollection with: resource evaluationResultForAliveMutant)
]

{ #category : 'accessing' }
MTGeneralResultTest >> mutationEngineGeneralResultWithOneKilledMutantByError [
	"Returns a Mutant Engine General Result with only one mutant killed by
	error. "

	^ MTGeneralResult for: (OrderedCollection with:
			   resource evaluationResultForKilledMutantByError)
]

{ #category : 'accessing' }
MTGeneralResultTest >> mutationEngineGeneralResultWithOneKilledMutantByFailure [
	"Returns a Mutant Engine General Result with only one mutant killed by
	failure."

	^ MTGeneralResult for: (OrderedCollection with:
			   resource evaluationResultForKilledMutantByFailure)
]

{ #category : 'accessing' }
MTGeneralResultTest >> mutationEngineGeneralResultWithOneTerminatedMutant [
	"Returns a Mutant Engine General Result with only one terminated mutant."

	^ MTGeneralResult for:
		  (OrderedCollection with:
			   resource evaluationResultForTerminatedMutant)
]

{ #category : 'running' }
MTGeneralResultTest >> setUp [

	super setUp.
	resource := MTResource current
]

{ #category : 'testing' }
MTGeneralResultTest >> testAccessorsOnEmptyResult [
	"Test the accessors methods for an empty result set"
	| emptyResult |
	emptyResult := self mutationEngineGeneralEmptyResult.
	self assert: emptyResult numberOfEvaluatedMutants = 0.
	self assert: emptyResult numberOfKilledMutants = 0.
	self assert: emptyResult numberOfAliveMutants = 0.
	self assert: emptyResult numberOfTerminatedMutants = 0.
	self assert: emptyResult mutationScore = 0.
	self assert: emptyResult isNonAcceptableScore.
	self deny: emptyResult isAcceptableScore
]

{ #category : 'testing' }
MTGeneralResultTest >> testAccessorsWithOnlyOneAliveMutant [
	"Build a MutationEngineGeneralResult with only 1 alive mutant."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneAliveMutant.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 0.
	self assert: mutantResult numberOfAliveMutants = 1.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 0.
	self assert: mutantResult isNonAcceptableScore.
	self deny: mutantResult isAcceptableScore
]

{ #category : 'testing' }
MTGeneralResultTest >> testAccessorsWithOnlyOneKilledMutantByError [
	"Build a MutationEngineGeneralResult with only 1 killed mutant by error."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneKilledMutantByError.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 1.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 100.
	self deny: mutantResult isNonAcceptableScore.
	self assert: mutantResult isAcceptableScore
]

{ #category : 'testing' }
MTGeneralResultTest >> testAccessorsWithOnlyOneKilledMutantByFailure [
	"Build a MutationEngineGeneralResult with only 1 killed mutant by failure."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneKilledMutantByFailure.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 1.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 100.
	self deny: mutantResult isNonAcceptableScore.
	self assert: mutantResult isAcceptableScore
]

{ #category : 'testing' }
MTGeneralResultTest >> testAccessorsWithOnlyOneTerminatedMutant [
	"Build a MutationEngineGeneralResult with only 1 terminated mutant."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneTerminatedMutant.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 0.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 1.
	self assert: mutantResult mutationScore = 100.
	self assert: mutantResult isAcceptableScore.
	self deny: mutantResult isNonAcceptableScore
]

{ #category : 'testing - printing' }
MTGeneralResultTest >> testPrintingOnEmptyResult [
	"Test printing an empty general result"
	| emptyResult stream|
	emptyResult := self mutationEngineGeneralEmptyResult.
	stream := WriteStream with: '0 mutants, 0 killed, 0 alive, 0 terminated. Mutation Score: 0%.'.
	self assert: emptyResult printString = stream contents.
]

{ #category : 'testing - printing' }
MTGeneralResultTest >> testPrintingWithOnlyOneAliveMutant [
	"printing a mutation general result with only one alive mutant."
	| oneKilledMutantResult stream|
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneAliveMutant.
	stream := WriteStream with: '1 mutants, 0 killed, 1 alive, 0 terminated. Mutation Score: 0%.'.
	self assert: oneKilledMutantResult printString = stream contents.
]

{ #category : 'testing - printing' }
MTGeneralResultTest >> testPrintingWithOnlyOneKilledMutantByError [
	"printing a mutation general result with one mutant killed by error."
	| oneKilledMutantResult stream|
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneKilledMutantByError.
	stream := WriteStream with: '1 mutants, 1 killed, 0 alive, 0 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents.
]

{ #category : 'testing - printing' }
MTGeneralResultTest >> testPrintingWithOnlyOneKilledMutantByFailure [
	"printing a mutation general result with one mutant killed by failure."
	| oneKilledMutantResult stream |
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneKilledMutantByFailure.
	stream := WriteStream with: '1 mutants, 1 killed, 0 alive, 0 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents
]

{ #category : 'testing - printing' }
MTGeneralResultTest >> testPrintingWithOnlyOneTerminatedMutant [
	"printing a mutation general result with one mutant terminated."
	| oneKilledMutantResult stream |
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneTerminatedMutant.
	stream := WriteStream with: '1 mutants, 0 killed, 0 alive, 1 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents
]
