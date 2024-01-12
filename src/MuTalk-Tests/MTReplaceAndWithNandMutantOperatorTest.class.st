Class {
	#name : 'MTReplaceAndWithNandMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> methodWithOneSenderModified [
	^ true nand: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true nand: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true nand: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> operator [
	^ ReplaceAndWithNandMutantOperator new
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperatorTest >> operatorDescription [
	^'Replace #and: with #nand:'
]
