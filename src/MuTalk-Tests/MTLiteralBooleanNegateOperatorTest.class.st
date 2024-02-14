Class {
	#name : 'MTLiteralBooleanNegateOperatorTest',
	#superclass : 'MTPredicateBasedMutantOperatorTest',
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
MTLiteralBooleanNegateOperatorTest >> newNodeOneSender [

	^ RBLiteralValueNode value: false
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> newNodeTwoSendersFirst [

	^ RBLiteralValueNode value: false
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> newNodeTwoSendersSecond [

	^ RBLiteralValueNode value: true
]

{ #category : 'accessing' }
MTLiteralBooleanNegateOperatorTest >> operator [

	^ MTLiteralBooleanNegateOperator new
]
