Class {
	#name : 'MTReplaceAndReceiverWithTrueOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceAndReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
MTReplaceAndReceiverWithTrueOperatorTest >> methodWithOneSender [
	^1 = 2
		and: [2 = 2]
]

{ #category : 'accessing' }
MTReplaceAndReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	^true
		and: [2 = 2]
]

{ #category : 'accessing' }
MTReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	^1 = 2
		and: [2 = 2 and: [3 = 3]]
	
]

{ #category : 'accessing' }
MTReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^true
		and: [2 = 2 and: [3 = 3]]
]

{ #category : 'accessing' }
MTReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		and: [true and: [3 = 3]]
]

{ #category : 'accessing' }
MTReplaceAndReceiverWithTrueOperatorTest >> operator [
	^ MTReplaceAndReceiverWithTrueOperator new
]
