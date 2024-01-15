Class {
	#name : 'MTReplaceIfFalseWithIfTrueMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithOneSender [  
	false ifFalse: [^true]. 
 	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithOneSenderModified [  
	false ifTrue: [^true]. 
 	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSenders [
	false ifFalse: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifTrue: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	false ifFalse: [^true].
	true ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> operator [
	^ MTReplaceIfFalseWithIfTrueMutantOperator new
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperatorTest >> operatorDescription [
	^'Replace #ifFalse: with #ifTrue:'
]
