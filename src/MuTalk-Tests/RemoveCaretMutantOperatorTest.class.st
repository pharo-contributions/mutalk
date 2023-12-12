Class {
	#name : 'RemoveCaretMutantOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> methodWithNoSenders [  
	"a string that has ^ inside"
	OrderedCollection new do: [:elem | elem notNil]
]

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> methodWithOneSender [  
	^1 + 2
]

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> methodWithOneSenderModified [
	1 + 2
]

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> methodWithTwoSenders [
	true 
		ifTrue: [^1] 
		ifFalse: [^2]
]

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	true 
		ifTrue: [1] 
		ifFalse: [^2]
]

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	true 
		ifTrue: [^1] 
		ifFalse: [2]
]

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> operator [
	^ RemoveCaretOperator new
]

{ #category : 'accessing' }
RemoveCaretMutantOperatorTest >> operatorDescription [
	^ 'Remove ^' 
]
