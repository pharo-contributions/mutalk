Class {
	#name : 'MTRemoveAtIfAbsentMutantOperatorTest',
	#superclass : 'MTParseRewriterMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTRemoveAtIfAbsentMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MTRemoveAtIfAbsentMutantOperatorTest >> methodWithOneSender [  
	^Dictionary new 
		at: 1 
		ifAbsent: [2]
]

{ #category : 'accessing' }
MTRemoveAtIfAbsentMutantOperatorTest >> methodWithOneSenderModified [
	^[2] value
]

{ #category : 'accessing' }
MTRemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSenders [
	^Dictionary new 
		at: 1 
		ifAbsent: [Dictionary new 
						at: 2 
						ifAbsent: [3]]
]

{ #category : 'accessing' }
MTRemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^[Dictionary new 
		at: 2 
		ifAbsent: [3]] value
]

{ #category : 'accessing' }
MTRemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^Dictionary new 
		at: 1 
		ifAbsent: [[3] value]
]

{ #category : 'accessing' }
MTRemoveAtIfAbsentMutantOperatorTest >> operator [
	^ MTRemoveAtIfAbsentOperator new
]
