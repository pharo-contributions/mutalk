Class {
	#name : 'ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : 'accessing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : 'accessing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithOneSenderModified [
		^OrderedCollection new 
		detect: [:each | false] 
		ifNone: [true]
]

{ #category : 'accessing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSenders [
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
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | false] 
		ifNone: [0]
]

{ #category : 'accessing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:each | false] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : 'accessing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> operator [
	^ ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator new
]

{ #category : 'accessing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> operatorDescription [ 
	^'Replace detect: block with [:each | false] when #detect:ifNone: ' 
]
