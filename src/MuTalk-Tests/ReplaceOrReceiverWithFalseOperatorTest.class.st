Class {
	#name : #ReplaceOrReceiverWithFalseOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> methodWithOneSender [
	^1 = 2
		or: [2 = 2]
]

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	^false
		or: [2 = 2]
]

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	^1 = 2
		or: [2 = 2 or: [3 = 3]]
	
]

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	^false
		or: [2 = 2 or: [3 = 3]]
]

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		or: [false or: [3 = 3]]
]

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> operator [
	^ ReplaceOrReceiverWithFalseOperator new
]

{ #category : #accessing }
ReplaceOrReceiverWithFalseOperatorTest >> operatorDescription [
	^'Replace #or: receiver with false'
]
