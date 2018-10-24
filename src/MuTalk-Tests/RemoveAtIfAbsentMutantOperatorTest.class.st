Class {
	#name : #RemoveAtIfAbsentMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> methodWithOneSender [  
	^Dictionary new 
		at: 1 
		ifAbsent: [2]
]

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> methodWithOneSenderModified [
	^[2] value
]

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSenders [
	^Dictionary new 
		at: 1 
		ifAbsent: [Dictionary new 
						at: 2 
						ifAbsent: [3]]
]

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^[Dictionary new 
		at: 2 
		ifAbsent: [3]] value
]

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^Dictionary new 
		at: 1 
		ifAbsent: [[3] value]
]

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> operator [
	^ RemoveAtIfAbsentOperator new
]

{ #category : #accessing }
RemoveAtIfAbsentMutantOperatorTest >> operatorDescription [
	^ 'Remove at:ifAbsent:' 
]
