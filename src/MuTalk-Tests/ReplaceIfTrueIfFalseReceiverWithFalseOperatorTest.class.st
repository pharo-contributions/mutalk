Class {
	#name : #ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithOneSender [
	1 = 2
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
	
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	|a|
	a := false ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^false ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> operator [
	^ ReplaceIfTrueIfFalseReceiverWithFalseOperator new
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> operatorDescription [
	^'Replace #ifTrue:ifFalse: receiver with false'
]
