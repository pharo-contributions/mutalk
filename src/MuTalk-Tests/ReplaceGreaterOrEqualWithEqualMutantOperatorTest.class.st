Class {
	#name : #ReplaceGreaterOrEqualWithEqualMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithOneSender [  
	^ 2 >= 1
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithOneSenderModified [
	^ 2 = 1
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSenders [
	^ 1 >= 2 or: [2 >= 3].
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 = 2 or: [2 >= 3].
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 >= 2 or: [2 = 3].
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> operator [
	^ ReplaceGreaterOrEqualWithEqualMutantOperator new
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperatorTest >> operatorDescription [
	^'Replace #''>='' with #=' 
]
