"
I represent a mutation that does nothing for testing purposes
"
Class {
	#name : 'NullMutation',
	#superclass : 'Object',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
NullMutation >> runMutantStoppingOnError: aBoolean [
	
	"I am a null mutation that does not run any tests and does not install any code.
	Return an empty test result"
	^ TestResult new
]

{ #category : 'tests' }
NullMutation >> testCaseReferences: aCollection [ 
	
	"A null mutation does not track covering tests"
]
