Class {
	#name : 'MTLiteralBooleanNegateOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> methodWithNoSenders [

	^ Dictionary new at: #hello put: 'Hi'
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> methodWithOneSender [

	^ Dictionary new at: 1 ifAbsent: [ self error: true ]
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> methodWithOneSenderModified [

	^ Dictionary new at: 1 ifAbsent: [ self error: false ]
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> methodWithTwoSenders [

	^ true & false
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> methodWithTwoSendersModifiedFirst [

	^ false & false
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> methodWithTwoSendersModifiedSecond [

	^ true & true
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> operator [

	^ LiteralBooleanNegateOperator new
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> operatorDescription [

	^ self operator description 
]
