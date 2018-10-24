Class {
	#name : #RemoveExceptionHandlerOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> methodWithNoSenders [  
	"[x y] on:E do:[:e| b] "
	OrderedCollection new do: [:elem | elem notNil]
]

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> methodWithOneSender [  
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> methodWithOneSenderModified [
	^[1 /0] value 
]

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> methodWithTwoSenders [
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> methodWithTwoSendersModifiedFirst [
	[self error:'an error'.] value.
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> methodWithTwoSendersModifiedSecond [
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] value
]

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> operator [
	^ RemoveExceptionHandlerOperator new
]

{ #category : #accessing }
RemoveExceptionHandlerOperatorTest >> operatorDescription [
	^ 'Remove Exception Handler Operator'
]
