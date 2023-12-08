Class {
	#name : 'ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : 'accessing' }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : 'accessing' }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: []
]

{ #category : 'accessing' }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSenders [
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
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
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

{ #category : 'accessing' }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
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

{ #category : 'accessing' }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> operator [
	^ ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator new
]

{ #category : 'accessing' }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> operatorDescription [ 
	^'Replace ifNone: block with [] when #detect:ifNone:'
]
