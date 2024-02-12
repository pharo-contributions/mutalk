Class {
	#name : 'MTReplaceIfFalseReceiverWithFalseOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithOneSender [  
	(1 = 2) ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifFalse: [^true].
	false ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseReceiverWithFalseOperatorTest >> operator [
	^ MTReplaceIfFalseReceiverWithFalseOperator new
]
