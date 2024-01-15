Class {
	#name : 'MTReplaceOrReceiverWithFalseOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> methodWithOneSender [
	^1 = 2
		or: [2 = 2]
]

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	^false
		or: [2 = 2]
]

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	^1 = 2
		or: [2 = 2 or: [3 = 3]]
	
]

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	^false
		or: [2 = 2 or: [3 = 3]]
]

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		or: [false or: [3 = 3]]
]

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> operator [
	^ MTReplaceOrReceiverWithFalseOperator new
]

{ #category : 'accessing' }
MTReplaceOrReceiverWithFalseOperatorTest >> operatorDescription [
	^'Replace #or: receiver with false'
]
