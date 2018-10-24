Class {
	#name : #ReplaceLessOrEqualWithLessMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithOneSender [  
	^ 1 <= 2
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 < 2
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSenders [
	^ 1 <= 2 or: [2 <= 3].
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 < 2 or: [2 <= 3].
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 <= 2 or: [2 < 3].
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> operator [
	^ ReplaceLessOrEqualWithLessMutantOperator new
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperatorTest >> operatorDescription [
	^'Replace #''<='' with #<' 
]
