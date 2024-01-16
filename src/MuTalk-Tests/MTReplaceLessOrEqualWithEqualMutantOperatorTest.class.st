Class {
	#name : 'MTReplaceLessOrEqualWithEqualMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithOneSender [  
	^ 1 <= 2
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 = 2
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSenders [
	^ 1 <= 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 = 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 <= 2 or: [2 = 3].
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> operator [
	^ MTReplaceLessOrEqualWithEqualMutantOperator new
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperatorTest >> operatorDescription [
	^'Replace #''<='' with #=' 
]
