Class {
	#name : 'MTReplaceOrWithAndMutantOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperatorTest >> methodWithOneSender [  
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperatorTest >> methodWithOneSenderModified [
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [false]]
]

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true and: [true or: [false]]
]

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperatorTest >> operator [
	^ MTReplaceOrWithAndMutantOperator new
]
