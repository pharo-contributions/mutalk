Class {
	#name : 'MTReplaceDoBlockWithEmptyBlockOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		do: [:element | element notNil]
]

{ #category : 'accessing' }
MTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		do: [:each | ]
]

{ #category : 'accessing' }
MTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		do: [:element | element notNil].
	OrderedCollection new 
		do: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		do: [:each | ].
	OrderedCollection new 
		do: [:element | element isNil]
]

{ #category : 'accessing' }
MTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		do: [:element | element notNil].
	OrderedCollection new 
		do: [:each | ]
]

{ #category : 'accessing' }
MTReplaceDoBlockWithEmptyBlockOperatorTest >> operator [
	^ MTReplaceDoBlockWithEmptyBlockOperator new
]
