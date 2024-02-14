Class {
	#name : 'MTReplaceIfTrueReceiverWithTrueOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithOneSender [  
	(1 = 2) ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifTrue: [^true].
	true ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfTrueReceiverWithTrueOperatorTest >> operator [
	^ MTReplaceIfTrueReceiverWithTrueOperator new
]
