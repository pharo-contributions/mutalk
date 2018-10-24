Class {
	#name : #ReplacePlusWithMinusMutantOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> methodWithOneSender [  
	^ 1 + 2
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 - 2
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSenders [
	^ 1 + 2 + 3
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 + 2 - 3
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 - 2 + 3
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> operator [
	^ ReplacePlusWithMinusMutantOperator new
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperatorTest >> operatorDescription [
	^'Replace #+ with #-'
]
