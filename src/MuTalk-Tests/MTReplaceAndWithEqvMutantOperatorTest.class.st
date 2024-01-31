Class {
	#name : 'MTReplaceAndWithEqvMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperatorTest >> methodWithOneSenderModified [
	^ true bEqv: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true bEqv: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true bEqv: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperatorTest >> operator [
	^ MTReplaceAndWithEqvMutantOperator new
]
