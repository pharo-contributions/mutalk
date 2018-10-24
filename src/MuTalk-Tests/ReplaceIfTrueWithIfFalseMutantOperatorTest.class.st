Class {
	#name : #ReplaceIfTrueWithIfFalseMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithOneSender [  
	true ifTrue: [^true]. 
	 ^false
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithOneSenderModified [
	true ifFalse: [^true]. 
	 ^false
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSenders [
	true ifTrue: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifFalse: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	true ifTrue: [^true].
	false ifFalse: [^true].
	^false
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> operator [
	^ ReplaceIfTrueWithIfFalseMutantOperator new
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperatorTest >> operatorDescription [
	^'Replace #ifTrue: with #ifFalse:'
]
