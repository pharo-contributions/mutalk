Class {
	#name : 'MTReplaceAndWithOrMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [true and: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true or: [false]]
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> operator [
	^ MTReplaceAndWithOrMutantOperator new
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperatorTest >> operatorDescription [
	^'Replace #and: with #or:'
]
