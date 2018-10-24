Class {
	#name : #ReplaceAndWithFalseMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> methodWithOneSenderModified [
	^ false
]

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ false
]

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [false]
]

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> operator [
	^ ReplaceAndWithFalseOperator new
]

{ #category : #accessing }
ReplaceAndWithFalseMutantOperatorTest >> operatorDescription [
	^'Replace #and: with false'
]
