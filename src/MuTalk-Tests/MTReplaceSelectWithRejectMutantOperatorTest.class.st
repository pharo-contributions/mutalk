Class {
	#name : 'MTReplaceSelectWithRejectMutantOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		select: [:element | element notNil]
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		reject: [:element | element notNil]
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperatorTest >> operator [
	^ MTReplaceSelectWithRejectMutantOperator new
]
