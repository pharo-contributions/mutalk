"
I represent a mutation that does nothing for testing purposes
"
Class {
	#name : 'MTNullMutation',
	#superclass : 'Object',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTNullMutation >> runMutantStoppingOnError: aBoolean in: aMTMutantEvaluation [
	"I am a null mutation that does not run any tests and does not install any code.
	Return an empty test result"

	^ MTMutantEvaluationResultSurvived new
]

{ #category : 'tests' }
MTNullMutation >> testCaseReferences: aCollection [ 
	
	"A null mutation does not track covering tests"
]
