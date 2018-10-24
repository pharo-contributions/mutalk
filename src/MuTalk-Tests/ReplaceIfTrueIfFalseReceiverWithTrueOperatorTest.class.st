Class {
	#name : #ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithOneSender [
	1 = 2
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
	
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	|a|
	a := true ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^true ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> operator [
	^ ReplaceIfTrueIfFalseReceiverWithTrueOperator new
]

{ #category : #accessing }
ReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> operatorDescription [
	^'Replace #ifTrue:ifFalse: receiver with true'
]
