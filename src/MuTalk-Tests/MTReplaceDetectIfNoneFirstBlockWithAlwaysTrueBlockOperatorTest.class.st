Class {
	#name : 'MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithOneSenderModified [
		^OrderedCollection new 
		detect: [:each | true] 
		ifNone: [true]
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSenders [
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

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | true] 
		ifNone: [0]
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:each | true] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> operator [
	^ MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator new
]
