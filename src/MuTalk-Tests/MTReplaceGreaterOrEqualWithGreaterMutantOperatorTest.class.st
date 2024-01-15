Class {
	#name : 'MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithOneSender [  
	^ 2 >= 1
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithOneSenderModified [
	^ 2 > 1
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSenders [
	^ 1 >= 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 > 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 >= 2 or: [2 > 3].
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> operator [
	^ MTReplaceGreaterOrEqualWithGreaterMutantOperator new
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> operatorDescription [
	^'Replace #''>='' with #>' 
]
