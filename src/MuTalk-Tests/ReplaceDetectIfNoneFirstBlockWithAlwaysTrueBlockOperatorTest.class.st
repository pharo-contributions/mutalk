Class {
	#name : #ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : #accessing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : #accessing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithOneSenderModified [
		^OrderedCollection new 
		detect: [:each | true] 
		ifNone: [true]
]

{ #category : #accessing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSenders [
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
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | true] 
		ifNone: [0]
]

{ #category : #accessing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
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

{ #category : #accessing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> operator [
	^ ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator new
]

{ #category : #accessing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> operatorDescription [ 
	^'Replace detect: block with [:each | true] when #detect:ifNone: ' 
]
