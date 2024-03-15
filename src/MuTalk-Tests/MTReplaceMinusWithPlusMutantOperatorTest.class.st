Class {
	#name : #MTReplaceMinusWithPlusMutantOperatorTest,
	#superclass : #MTParseRewriterMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperatorTest >> methodWithOneSender [  
	^ 1 - 2
]

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 + 2
]

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSenders [
	^ 1 - 2 - 3
]

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 - 2 + 3
]

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 + 2 - 3
]

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperatorTest >> operator [
	^ MTReplaceMinusWithPlusMutantOperator new
]
