Class {
	#name : #MTReplaceAndWithFalseMutantOperatorTest,
	#superclass : #MTParseRewriterMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : #accessing }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : #accessing }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithOneSenderModified [
	^ false
]

{ #category : #accessing }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : #accessing }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ false
]

{ #category : #accessing }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [false]
]

{ #category : #accessing }
MTReplaceAndWithFalseMutantOperatorTest >> operator [
	^ MTReplaceAndWithFalseOperator new
]
