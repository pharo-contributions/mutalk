Class {
	#name : 'ReplaceAndReceiverWithTrueOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> methodWithOneSender [
	^1 = 2
		and: [2 = 2]
]

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	^true
		and: [2 = 2]
]

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	^1 = 2
		and: [2 = 2 and: [3 = 3]]
	
]

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^true
		and: [2 = 2 and: [3 = 3]]
]

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		and: [true and: [3 = 3]]
]

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> operator [
	^ ReplaceAndReceiverWithTrueOperator new
]

{ #category : 'accessing' }
ReplaceAndReceiverWithTrueOperatorTest >> operatorDescription [
	^'Replace #and: receiver with true'
]
