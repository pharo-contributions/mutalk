Class {
	#name : #MTReplaceIfTrueWithIfFalseMutantOperatorTest,
	#superclass : #MTParseRewriterMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithOneSender [  
	true ifTrue: [^true]. 
	 ^false
]

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithOneSenderModified [
	true ifFalse: [^true]. 
	 ^false
]

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSenders [
	true ifTrue: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifFalse: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	true ifTrue: [^true].
	false ifFalse: [^true].
	^false
]

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperatorTest >> operator [
	^ MTReplaceIfTrueWithIfFalseMutantOperator new
]
