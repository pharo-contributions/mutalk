Class {
	#name : 'MTReplaceWhileFalseReceiverWithTrueOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithOneSender [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [

	true whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [

	1 < 2 whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [

	true whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileFalse: [  ].
	true whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithTrueOperatorTest >> operator [

	^ MTReplaceWhileFalseReceiverWithTrueOperator new
]
