Class {
	#name : #ReplaceIfFalseReceiverWithFalseOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithOneSender [  
	(1 = 2) ifFalse: [^true]. 
	 ^false
]

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false ifFalse: [^true]. 
	 ^false
]

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifFalse: [^true].
	false ifFalse: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> operator [
	^ ReplaceIfFalseReceiverWithFalseOperator new
]

{ #category : #accessing }
ReplaceIfFalseReceiverWithFalseOperatorTest >> operatorDescription [
	^'Replace #ifFalse: receiver with false'
]
