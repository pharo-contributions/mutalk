Class {
	#name : 'MTRemoveCaretMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> methodWithNoSenders [  
	"a string that has ^ inside"
	OrderedCollection new do: [:elem | elem notNil]
]

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> methodWithOneSender [  
	^1 + 2
]

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> methodWithOneSenderModified [
	1 + 2
]

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> methodWithTwoSenders [
	true 
		ifTrue: [^1] 
		ifFalse: [^2]
]

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	true 
		ifTrue: [1] 
		ifFalse: [^2]
]

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	true 
		ifTrue: [^1] 
		ifFalse: [2]
]

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> operator [
	^ RemoveCaretOperator new
]

{ #category : 'accessing' }
MTRemoveCaretMutantOperatorTest >> operatorDescription [
	^ 'Remove ^' 
]
