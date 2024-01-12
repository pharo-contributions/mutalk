Class {
	#name : 'MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithOneSender [
	1 = 2
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
	
]

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	|a|
	a := false ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^false ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> operator [
	^ ReplaceIfTrueIfFalseReceiverWithFalseOperator new
]

{ #category : 'accessing' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> operatorDescription [
	^'Replace #ifTrue:ifFalse: receiver with false'
]
