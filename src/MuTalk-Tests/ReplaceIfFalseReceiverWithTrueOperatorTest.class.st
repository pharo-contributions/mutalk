Class {
	#name : 'ReplaceIfFalseReceiverWithTrueOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithOneSender [  
	(1 = 2) ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifFalse: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> operator [
	^ ReplaceIfFalseReceiverWithTrueOperator new
]

{ #category : 'accessing' }
ReplaceIfFalseReceiverWithTrueOperatorTest >> operatorDescription [
	^'Replace #ifFalse: receiver with true'
]
