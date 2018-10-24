Class {
	#name : #ReplaceSelectWithRejectMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		select: [:element | element notNil]
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		reject: [:element | element notNil]
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> operator [
	^ ReplaceSelectWithRejectMutantOperator new
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperatorTest >> operatorDescription [
	^'Replace #select: with #reject:'
]
