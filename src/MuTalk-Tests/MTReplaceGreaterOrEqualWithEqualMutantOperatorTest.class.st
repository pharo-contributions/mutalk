Class {
	#name : 'MTReplaceGreaterOrEqualWithEqualMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithOneSender [  
	^ 2 >= 1
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithOneSenderModified [
	^ 2 = 1
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSenders [
	^ 1 >= 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 = 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 >= 2 or: [2 = 3].
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> operator [
	^ MTReplaceGreaterOrEqualWithEqualMutantOperator new
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> operatorDescription [
	^'Replace #''>='' with #=' 
]
