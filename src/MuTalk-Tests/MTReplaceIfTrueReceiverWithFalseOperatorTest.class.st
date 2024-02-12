Class {
	#name : 'MTReplaceIfTrueReceiverWithFalseOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithOneSender [  
	(1 = 2) ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifTrue: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithFalseOperatorTest >> operator [
	^ MTReplaceIfTrueReceiverWithFalseOperator new
]
