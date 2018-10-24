Class {
	#name : #ReplaceAndWithNandMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> methodWithOneSenderModified [
	^ true nand: [false]
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true nand: [true and: [false]]
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true nand: [false]]
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> operator [
	^ ReplaceAndWithNandMutantOperator new
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperatorTest >> operatorDescription [
	^'Replace #and: with #nand:'
]
