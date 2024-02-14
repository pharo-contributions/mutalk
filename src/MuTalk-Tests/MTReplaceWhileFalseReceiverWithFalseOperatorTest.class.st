Class {
	#name : 'MTReplaceWhileFalseReceiverWithFalseOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithOneSender [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [

	false whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [

	1 < 2 whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [

	false whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileFalse: [  ].
	false whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseReceiverWithFalseOperatorTest >> operator [

	^ MTReplaceWhileFalseReceiverWithFalseOperator new
]
