Class {
	#name : #LiteralBooleanNegateOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : #'MuTalk-Tests'
}

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> methodWithNoSenders [

	^ Dictionary new at: #hello put: 'Hi'
]

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> methodWithOneSender [

	^ Dictionary new at: 1 ifAbsent: [ self error: true ]
]

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> methodWithOneSenderModified [

	^ Dictionary new at: 1 ifAbsent: [ self error: false ]
]

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> methodWithTwoSenders [

	^ true & false
]

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> methodWithTwoSendersModifiedFirst [

	^ false & false
]

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> methodWithTwoSendersModifiedSecond [

	^ true & true
]

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> operator [

	^ LiteralBooleanNegateOperator new
]

{ #category : #accessing }
LiteralBooleanNegateOperatorTest >> operatorDescription [

	^ self operator description 
]
