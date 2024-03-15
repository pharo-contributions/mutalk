Class {
	#name : #MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest,
	#superclass : #MTParseRewriterMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : #accessing }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : #accessing }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: []
]

{ #category : #accessing }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSenders [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:otherNumber | number > otherNumber] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : #accessing }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:otherNumber | number > otherNumber] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: []
]

{ #category : #accessing }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:otherNumber | number > otherNumber] 
							ifNone: [].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : #accessing }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> operator [
	^ MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator new
]
