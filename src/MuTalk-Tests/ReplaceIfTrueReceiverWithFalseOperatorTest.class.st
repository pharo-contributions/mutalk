Class {
	#name : #ReplaceIfTrueReceiverWithFalseOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithOneSender [  
	(1 = 2) ifTrue: [^true]. 
	 ^false
]

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false ifTrue: [^true]. 
	 ^false
]

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifTrue: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> operator [
	^ ReplaceIfTrueReceiverWithFalseOperator new
]

{ #category : #accessing }
ReplaceIfTrueReceiverWithFalseOperatorTest >> operatorDescription [
	^'Replace #ifTrue: receiver with false'
]
