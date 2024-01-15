Class {
	#name : 'MTReplaceAndWithFalseMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithOneSenderModified [
	^ false
]

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ false
]

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> operator [
	^ MTReplaceAndWithFalseOperator new
]

{ #category : 'accessing' }
MTReplaceAndWithFalseMutantOperatorTest >> operatorDescription [
	^'Replace #and: with false'
]
