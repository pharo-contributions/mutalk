Class {
	#name : 'ReplaceMinusWithPlusMutantOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> methodWithOneSender [  
	^ 1 - 2
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 + 2
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSenders [
	^ 1 - 2 - 3
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 - 2 + 3
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 + 2 - 3
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> operator [
	^ ReplaceMinusWithPlusMutantOperator new
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperatorTest >> operatorDescription [
	^'Replace #- with #+'
]
