Class {
	#name : 'MTReplaceIfFalseReceiverWithTrueOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithOneSender [  
	(1 = 2) ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifFalse: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> operator [
	^ ReplaceIfFalseReceiverWithTrueOperator new
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithTrueOperatorTest >> operatorDescription [
	^'Replace #ifFalse: receiver with true'
]
