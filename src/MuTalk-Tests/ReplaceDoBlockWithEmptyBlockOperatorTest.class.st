Class {
	#name : 'ReplaceDoBlockWithEmptyBlockOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		do: [:element | element notNil]
]

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		do: [:each | ]
]

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		do: [:element | element notNil].
	OrderedCollection new 
		do: [:element | element isNil]
]

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		do: [:each | ].
	OrderedCollection new 
		do: [:element | element isNil]
]

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		do: [:element | element notNil].
	OrderedCollection new 
		do: [:each | ]
]

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> operator [
	^ ReplaceDoBlockWithEmptyBlockOperator new
]

{ #category : 'accessing' }
ReplaceDoBlockWithEmptyBlockOperatorTest >> operatorDescription [
	^'Replace do block with [:each |]'.
]
