Class {
	#name : 'ReplaceOrWithXorMutantOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> methodWithOneSender [  
	^ true or: [false]
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> methodWithOneSenderModified [
	^ true bXor: [false]
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [false]]
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true bXor: [true or: [false]]
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true bXor: [false]]
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> operator [
	^ ReplaceOrWithXorMutantOperator new
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperatorTest >> operatorDescription [
	^'Replace #or: with #bXor:'
]
