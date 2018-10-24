Class {
	#name : #ReplaceOrArgumentWithFalseOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSender [  
	^ true or: [true]
]

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [true]]
]

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [false]
]

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true or: [false]]
]

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> operator [
	^ ReplaceOrArgumentWithFalseOperator new
]

{ #category : #accessing }
ReplaceOrArgumentWithFalseOperatorTest >> operatorDescription [
	^'Replace #or: argument with [false]'
]
