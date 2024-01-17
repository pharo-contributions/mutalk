Class {
	#name : 'MTReplaceIsEmptyWithNotEmptyMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new isEmpty
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new notEmpty
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new isEmpty.
	OrderedCollection new isEmpty
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new notEmpty.
	OrderedCollection new isEmpty
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new isEmpty.
	OrderedCollection new notEmpty
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> operator [
	^MTReplaceIsEmptyWithNotEmptyMutantOperator new
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> operatorDescription [
	^'Replace #isEmpty with #notEmpty'
]
