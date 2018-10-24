Class {
	#name : #ReplaceLessOrEqualWithEqualMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithOneSender [  
	^ 1 <= 2
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 = 2
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSenders [
	^ 1 <= 2 or: [2 <= 3].
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 = 2 or: [2 <= 3].
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 <= 2 or: [2 = 3].
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> operator [
	^ ReplaceLessOrEqualWithEqualMutantOperator new
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperatorTest >> operatorDescription [
	^'Replace #''<='' with #=' 
]
