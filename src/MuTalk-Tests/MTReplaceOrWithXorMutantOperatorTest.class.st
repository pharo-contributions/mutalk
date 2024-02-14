Class {
	#name : 'MTReplaceOrWithXorMutantOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperatorTest >> methodWithOneSender [  
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperatorTest >> methodWithOneSenderModified [
	^ true bXor: [false]
]

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [false]]
]

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true bXor: [true or: [false]]
]

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true bXor: [false]]
]

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperatorTest >> operator [
	^ MTReplaceOrWithXorMutantOperator new
]
