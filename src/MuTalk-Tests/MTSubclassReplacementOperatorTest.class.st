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

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> assertApplyingMutantWithFirstSubclassInClassWithManySubclassesMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor:
				   self class >> #methodUsingClassWithManySubclasses
				   number: 1
				   newExpression: self newExpressionFirstSubclass)
		  withSourceInMethod:
		  self class >> #methodUsingClassWithManySubclassesModifiedFirst
		  replacingSelector: #methodUsingClassWithManySubclasses
]

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> assertApplyingMutantWithSecondSubclassInClassWithManySubclassesMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor:
				   self class >> #methodUsingClassWithManySubclasses
				   number: 1
				   newExpression: self newExpressionSecondSubclass)
		  withSourceInMethod:
		  self class >> #methodUsingClassWithManySubclassesModifiedSecond
		  replacingSelector: #methodUsingClassWithManySubclasses
]

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> assertApplyingMutantWithThirdSubclassInClassWithManySubclassesMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor:
				   self class >> #methodUsingClassWithManySubclasses
				   number: 1
				   newExpression: self newExpressionThirdSubclass)
		  withSourceInMethod:
		  self class >> #methodUsingClassWithManySubclassesModifiedThird
		  replacingSelector: #methodUsingClassWithManySubclasses
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclasses [

	| object |
	object := MTAuxiliarClassForSubclassReplacementWithManySubclasses new
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclassesModifiedFirst [

	| object |
	object := MTAuxiliarSubclass1ForSubclassReplacementWithManySubclasses new
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclassesModifiedSecond [

	| object |
	object := MTAuxiliarSubclass2ForSubclassReplacementWithManySubclasses new
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclassesModifiedThird [

	| object |
	object := MTAuxiliarSubclass3ForSubclassReplacementWithManySubclasses new
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

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> newExpressionFirstSubclass [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy name:
		  MTAuxiliarSubclass1ForSubclassReplacementWithManySubclasses name.
	  nodeCopy ]
]

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> newExpressionSecondSubclass [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy name:
		  MTAuxiliarSubclass2ForSubclassReplacementWithManySubclasses name.
	  nodeCopy ]
]

{ #category : 'asserts' }
MTSubclassReplacementOperatorTest >> newExpressionThirdSubclass [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy name:
		  MTAuxiliarSubclass3ForSubclassReplacementWithManySubclasses name.
	  nodeCopy ]
]

{ #category : 'accessing' }
MTSubclassReplacementOperatorTest >> operator [

	^ MTSubclassReplacementOperator new
]

{ #category : 'tests' }
MTSubclassReplacementOperatorTest >> testSubclassReplacementWithManySubclasses [

	self assert: self
			assertApplyingMutantWithFirstSubclassInClassWithManySubclassesMethod.
	self assert: self
			assertApplyingMutantWithSecondSubclassInClassWithManySubclassesMethod.
	self assert: self
			assertApplyingMutantWithThirdSubclassInClassWithManySubclassesMethod
]
