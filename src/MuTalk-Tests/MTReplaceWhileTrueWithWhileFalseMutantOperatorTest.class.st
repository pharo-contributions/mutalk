Class {
	#name : 'MTReplaceWhileTrueWithWhileFalseMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithOneSender [

	1 < 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithOneSenderModified [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithTwoSenders [

	1 < 2 whileTrue: [  ].
	3 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	1 < 2 whileFalse: [  ].
	3 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileTrue: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> operator [

	^ MTReplaceWhileTrueWithWhileFalseMutantOperator new
]
