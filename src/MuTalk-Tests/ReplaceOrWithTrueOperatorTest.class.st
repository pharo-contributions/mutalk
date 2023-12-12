Class {
	#name : 'ReplaceOrWithTrueOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> methodWithOneSender [  
	^ true or: [true]
]

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> methodWithOneSenderModified [
	^ true
]

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [true]]
]

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true
]

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true]
]

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> operator [
	^ ReplaceOrWithTrueOperator new
]

{ #category : 'accessing' }
ReplaceOrWithTrueOperatorTest >> operatorDescription [
	^'Replace #or: with true'
]
