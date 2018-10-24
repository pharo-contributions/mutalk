Class {
	#name : #ReplaceIfFalseWithIfTrueMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithOneSender [  
	false ifFalse: [^true]. 
 	^false
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithOneSenderModified [  
	false ifTrue: [^true]. 
 	^false
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSenders [
	false ifFalse: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifTrue: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	false ifFalse: [^true].
	true ifTrue: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> operator [
	^ ReplaceIfFalseWithIfTrueMutantOperator new
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperatorTest >> operatorDescription [
	^'Replace #ifFalse: with #ifTrue:'
]
