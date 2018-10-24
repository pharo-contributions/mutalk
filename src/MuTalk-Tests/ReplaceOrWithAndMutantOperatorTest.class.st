Class {
	#name : #ReplaceOrWithAndMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> methodWithOneSender [  
	^ true or: [false]
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> methodWithOneSenderModified [
	^ true and: [false]
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [false]]
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true and: [true or: [false]]
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true and: [false]]
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> operator [
	^ ReplaceOrWithAndMutantOperator new
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperatorTest >> operatorDescription [
	^'Replace #or: with #and:'
]
