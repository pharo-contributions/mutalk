"
A LiteralIntegersIncreaseOperatorTest is a test class for testing the behavior of LiteralIntegersIncreaseOperator
"
Class {
	#name : 'LiteralIntegersIncreaseOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> methodWithNoSenders [

	^ Dictionary new at: #hello put: 'Hi'
]

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> methodWithOneSender [

	^ Dictionary new at: 1 ifAbsent: [ self error: 'hi' ]
]

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> methodWithOneSenderModified [

	^ Dictionary new at: 2 ifAbsent: [ self error: 'hi' ]
]

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> methodWithTwoSenders [

	^ 1 >= 2
]

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> methodWithTwoSendersModifiedFirst [

	^ 2 >= 2
]

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> methodWithTwoSendersModifiedSecond [

	^ 1 >= 3
]

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> operator [

	^ LiteralIntegersIncreaseOperator new
]

{ #category : 'accessing' }
LiteralIntegersIncreaseOperatorTest >> operatorDescription [

	^ 'Increase a literal integer'
]
