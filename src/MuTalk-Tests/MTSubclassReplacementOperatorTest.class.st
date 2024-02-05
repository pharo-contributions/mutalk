Class {
	#name : 'MTSubclassReplacementOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithOneSender
				   number: 1
				   newExpression: self newExpression)
		  withSourceInMethod: self class >> #methodWithOneSenderModified
		  replacingSelector: #methodWithOneSender
]

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 1
				   newExpression: self newExpression)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedFirst
		  replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 2
				   newExpression: self newExpression)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedSecond
		  replacingSelector: #methodWithTwoSenders
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodWithOneSender [

	| object |
	object := MTAuxiliarClassForSubclassReplacementOperator new
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodWithOneSenderModified [

	| object |
	object := MTAuxiliarSubclassForSubclassReplacementOperator new
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodWithTwoSenders [

	| object |
	object := MTAuxiliarClassForSubclassReplacementOperator new.
	object := MTAuxiliarClassForSubclassReplacementOperator new
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodWithTwoSendersModifiedFirst [

	| object |
	object := MTAuxiliarSubclassForSubclassReplacementOperator new.
	object := MTAuxiliarClassForSubclassReplacementOperator new
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodWithTwoSendersModifiedSecond [

	| object |
	object := MTAuxiliarClassForSubclassReplacementOperator new.
	object := MTAuxiliarSubclassForSubclassReplacementOperator new
]

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> newExpression [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy name:
		  MTAuxiliarSubclassForSubclassReplacementOperator name.
	  nodeCopy ]
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> operator [

	^ MTSubclassReplacementOperator new
]
