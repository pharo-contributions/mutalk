Class {
	#name : 'MTRemoveExceptionHandlerOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> methodWithNoSenders [  
	"[x y] on:E do:[:e| b] "
	OrderedCollection new do: [:elem | elem notNil]
]

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> methodWithOneSender [  
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> methodWithOneSenderModified [
	^[1 /0] value 
]

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> methodWithTwoSenders [
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> methodWithTwoSendersModifiedFirst [
	[self error:'an error'.] value.
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> methodWithTwoSendersModifiedSecond [
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] value
]

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> operator [
	^ RemoveExceptionHandlerOperator new
]

{ #category : 'accessing' }
MTRemoveExceptionHandlerOperatorTest >> operatorDescription [
	^ 'Remove Exception Handler Operator'
]
