Class {
	#name : 'MTReplaceWhileTrueReceiverWithFalseOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithOneSender [

	1 < 1 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithOneSenderModified [

	false whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithTwoSenders [

	1 < 1 whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [

	false whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 1 whileTrue: [  ].
	false whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithFalseOperatorTest >> operator [

	^ MTReplaceWhileTrueReceiverWithFalseOperator new
]
