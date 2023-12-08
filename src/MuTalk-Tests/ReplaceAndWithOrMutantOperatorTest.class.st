Class {
	#name : 'ReplaceAndWithOrMutantOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [true and: [false]]
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true or: [false]]
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> operator [
	^ ReplaceAndWithOrMutantOperator new
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperatorTest >> operatorDescription [
	^'Replace #and: with #or:'
]
