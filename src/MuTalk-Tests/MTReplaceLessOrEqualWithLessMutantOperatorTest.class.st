Class {
	#name : 'MTReplaceLessOrEqualWithLessMutantOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithOneSender [  
	^ 1 <= 2
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 < 2
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSenders [
	^ 1 <= 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 < 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 <= 2 or: [2 < 3].
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperatorTest >> operator [
	^ MTReplaceLessOrEqualWithLessMutantOperator new
]
