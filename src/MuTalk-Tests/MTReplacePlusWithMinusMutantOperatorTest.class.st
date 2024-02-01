Class {
	#name : 'MTReplacePlusWithMinusMutantOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTReplacePlusWithMinusMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MTReplacePlusWithMinusMutantOperatorTest >> methodWithOneSender [  
	^ 1 + 2
]

{ #category : 'accessing' }
MTReplacePlusWithMinusMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 - 2
]

{ #category : 'accessing' }
MTReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSenders [
	^ 1 + 2 + 3
]

{ #category : 'accessing' }
MTReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 + 2 - 3
]

{ #category : 'accessing' }
MTReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 - 2 + 3
]

{ #category : 'accessing' }
MTReplacePlusWithMinusMutantOperatorTest >> operator [
	^ MTReplacePlusWithMinusMutantOperator new
]
