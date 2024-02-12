Class {
	#name : 'MTReplaceOrWithTrueOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceOrWithTrueOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceOrWithTrueOperatorTest >> methodWithOneSender [  
	^ true or: [true]
]

{ #category : 'accessing' }
MTReplaceOrWithTrueOperatorTest >> methodWithOneSenderModified [
	^ true
]

{ #category : 'accessing' }
MTReplaceOrWithTrueOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [true]]
]

{ #category : 'accessing' }
MTReplaceOrWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true
]

{ #category : 'accessing' }
MTReplaceOrWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true]
]

{ #category : 'accessing' }
MTReplaceOrWithTrueOperatorTest >> operator [
	^ MTReplaceOrWithTrueOperator new
]
