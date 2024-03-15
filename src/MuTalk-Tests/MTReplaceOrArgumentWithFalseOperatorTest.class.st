Class {
	#name : #MTReplaceOrArgumentWithFalseOperatorTest,
	#superclass : #MTParseRewriterMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : #accessing }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSender [  
	^ true or: [true]
]

{ #category : #accessing }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : #accessing }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [true]]
]

{ #category : #accessing }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [false]
]

{ #category : #accessing }
MTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true or: [false]]
]

{ #category : #accessing }
MTReplaceOrArgumentWithFalseOperatorTest >> operator [
	^ MTReplaceOrArgumentWithFalseOperator new
]
