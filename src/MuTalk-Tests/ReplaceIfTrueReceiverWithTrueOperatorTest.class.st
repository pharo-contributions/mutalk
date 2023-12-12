Class {
	#name : 'ReplaceIfTrueReceiverWithTrueOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithOneSender [  
	(1 = 2) ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifTrue: [^true].
	true ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> operator [
	^ ReplaceIfTrueReceiverWithTrueOperator new
]

{ #category : 'accessing' }
ReplaceIfTrueReceiverWithTrueOperatorTest >> operatorDescription [
	^'Replace #ifTrue: receiver with true'
]
