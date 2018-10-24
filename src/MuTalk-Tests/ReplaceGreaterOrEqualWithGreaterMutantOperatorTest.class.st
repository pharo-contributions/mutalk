Class {
	#name : #ReplaceGreaterOrEqualWithGreaterMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithOneSender [  
	^ 2 >= 1
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithOneSenderModified [
	^ 2 > 1
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSenders [
	^ 1 >= 2 or: [2 >= 3].
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 > 2 or: [2 >= 3].
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 >= 2 or: [2 > 3].
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> operator [
	^ ReplaceGreaterOrEqualWithGreaterMutantOperator new
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> operatorDescription [
	^'Replace #''>='' with #>' 
]
