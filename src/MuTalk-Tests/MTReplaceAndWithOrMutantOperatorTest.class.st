Class {
	#name : 'MTReplaceAndWithOrMutantOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true or: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> operator [
	^ MTReplaceAndWithOrMutantOperator new
]
