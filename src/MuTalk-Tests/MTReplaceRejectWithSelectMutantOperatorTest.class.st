Class {
	#name : 'MTReplaceRejectWithSelectMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		reject: [:element | element notNil]
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		select: [:element | element notNil]
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> operator [
	^ ReplaceRejectWithSelectMutantOperator new
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperatorTest >> operatorDescription [
	^'Replace #reject: with #select:'
]
