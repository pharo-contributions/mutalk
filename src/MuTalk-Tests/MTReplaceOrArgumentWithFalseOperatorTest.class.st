Class {
	#name : 'MTReplaceOrArgumentWithFalseOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSender [  
	^ true or: [true]
]

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [true]]
]

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true or: [false]]
]

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> operator [
	^ ReplaceOrArgumentWithFalseOperator new
]

{ #category : 'accessing' }
MTReplaceOrArgumentWithFalseOperatorTest >> operatorDescription [
	^'Replace #or: argument with [false]'
]
