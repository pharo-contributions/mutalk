Class {
	#name : 'ReplaceAndArgumentWithTrueOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[false].
]

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> methodWithOneSender [
	^1 = 2
		and: [2 = 2]
]

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> methodWithOneSenderModified [
	^1=2
		and: [true]
]

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> methodWithTwoSenders [
	^1 = 2
		and: [2 = 2 and: [3 = 3]]
	
]

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^1=2
		and: [true]
]

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		and: [2 = 2 and: [true]]
]

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> operator [
	^ ReplaceAndArgumentWithTrueOperator new.
]

{ #category : 'accessing' }
ReplaceAndArgumentWithTrueOperatorTest >> operatorDescription [
	^'Replace #and: argument with [true]'
]
