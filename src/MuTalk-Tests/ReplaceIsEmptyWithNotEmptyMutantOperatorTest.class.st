Class {
	#name : 'ReplaceIsEmptyWithNotEmptyMutantOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new isEmpty
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new notEmpty
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new isEmpty.
	OrderedCollection new isEmpty
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new notEmpty.
	OrderedCollection new isEmpty
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new isEmpty.
	OrderedCollection new notEmpty
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> operator [
	^ReplaceIsEmptyWithNotEmptyMutantOperator new
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperatorTest >> operatorDescription [
	^'Replace #isEmpty with #notEmpty'
]
