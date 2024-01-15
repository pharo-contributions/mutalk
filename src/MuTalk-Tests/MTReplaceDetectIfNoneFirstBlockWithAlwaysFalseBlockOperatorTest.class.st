Class {
	#name : 'MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithOneSenderModified [
		^OrderedCollection new 
		detect: [:each | false] 
		ifNone: [true]
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSenders [
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
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | false] 
		ifNone: [0]
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
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
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> operator [
	^ MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator new
]

{ #category : 'accessing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> operatorDescription [ 
	^'Replace detect: block with [:each | false] when #detect:ifNone: ' 
]
