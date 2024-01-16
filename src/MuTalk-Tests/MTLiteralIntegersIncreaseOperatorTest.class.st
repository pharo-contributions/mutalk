"
A LiteralIntegersIncreaseOperatorTest is a test class for testing the behavior of LiteralIntegersIncreaseOperator
"
Class {
	#name : 'MTLiteralIntegersIncreaseOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> methodWithNoSenders [

	^ Dictionary new at: #hello put: 'Hi'
]

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> methodWithOneSender [

	^ Dictionary new at: 1 ifAbsent: [ self error: 'hi' ]
]

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> methodWithOneSenderModified [

	^ Dictionary new at: 2 ifAbsent: [ self error: 'hi' ]
]

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> methodWithTwoSenders [

	^ 1 >= 2
]

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> methodWithTwoSendersModifiedFirst [

	^ 2 >= 2
]

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> methodWithTwoSendersModifiedSecond [

	^ 1 >= 3
]

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> operator [

	^ MTLiteralIntegersIncreaseOperator new
]

{ #category : 'accessing' }
MTLiteralIntegersIncreaseOperatorTest >> operatorDescription [

	^ 'Increase a literal integer'
]
