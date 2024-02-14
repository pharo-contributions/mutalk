Class {
	#name : 'MTReplaceWhileFalseWithWhileTrueMutantOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithOneSender [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithOneSenderModified [

	1 < 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithTwoSenders [

	1 < 2 whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	1 < 2 whileTrue: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileFalse: [  ].
	3 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> operator [

	^ MTReplaceWhileFalseWithWhileTrueMutantOperator new
]
