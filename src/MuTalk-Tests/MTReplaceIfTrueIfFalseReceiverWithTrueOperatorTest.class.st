Class {
	#name : #MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest,
	#superclass : #MTParseRewriterMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : #accessing }
MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithOneSender [
	1 = 2
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : #accessing }
MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : #accessing }
MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
	
]

{ #category : #accessing }
MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	|a|
	a := true ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : #accessing }
MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^true ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : #accessing }
MTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> operator [
	^ MTReplaceIfTrueIfFalseReceiverWithTrueOperator new
]
