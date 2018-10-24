Class {
	#name : #ReplaceAndWithEqvMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> methodWithOneSenderModified [
	^ true bEqv: [false]
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true bEqv: [true and: [false]]
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true bEqv: [false]]
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> operator [
	^ ReplaceAndWithEqvMutantOperator new
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperatorTest >> operatorDescription [
	^'Replace #and: with #bEqv:'
]
