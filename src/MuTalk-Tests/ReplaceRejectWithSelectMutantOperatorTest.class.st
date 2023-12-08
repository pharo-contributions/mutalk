Class {
	#name : 'ReplaceRejectWithSelectMutantOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		reject: [:element | element notNil]
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		select: [:element | element notNil]
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> operator [
	^ ReplaceRejectWithSelectMutantOperator new
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperatorTest >> operatorDescription [
	^'Replace #reject: with #select:'
]
