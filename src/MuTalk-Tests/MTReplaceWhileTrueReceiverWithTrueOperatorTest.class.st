Class {
	#name : 'MTReplaceWhileTrueReceiverWithTrueOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithOneSender [

	1 < 1 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithOneSenderModified [

	true whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithTwoSenders [

	1 < 1 whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [

	true whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 1 whileTrue: [  ].
	true whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueReceiverWithTrueOperatorTest >> operator [

	^ MTReplaceWhileTrueReceiverWithTrueOperator new 
]
