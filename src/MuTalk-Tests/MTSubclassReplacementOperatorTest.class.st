Class {
	#name : #MTSubclassReplacementOperatorTest,
	#superclass : #MTPredicateBasedMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #asserts }
MTSubclassReplacementOperatorTest >> assertApplyingMutantWithFirstSubclassInClassWithManySubclassesMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor:
				   self class >> #methodUsingClassWithManySubclasses
				   number: 1
				   newExpression: self newNodeFirstSubclass)
		  withSourceInMethod:
		  self class >> #methodUsingClassWithManySubclassesModifiedFirst
		  replacingSelector: #methodUsingClassWithManySubclasses
]

{ #category : #asserts }
MTSubclassReplacementOperatorTest >> assertApplyingMutantWithSecondSubclassInClassWithManySubclassesMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor:
				   self class >> #methodUsingClassWithManySubclasses
				   number: 1
				   newExpression: self newNodeSecondSubclass)
		  withSourceInMethod:
		  self class >> #methodUsingClassWithManySubclassesModifiedSecond
		  replacingSelector: #methodUsingClassWithManySubclasses
]

{ #category : #asserts }
MTSubclassReplacementOperatorTest >> assertApplyingMutantWithThirdSubclassInClassWithManySubclassesMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor:
				   self class >> #methodUsingClassWithManySubclasses
				   number: 1
				   newExpression: self newNodeThirdSubclass)
		  withSourceInMethod:
		  self class >> #methodUsingClassWithManySubclassesModifiedThird
		  replacingSelector: #methodUsingClassWithManySubclasses
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclasses [

	| object |
	object := MTAuxiliarClassForSubclassReplacementWithManySubclasses new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclassesModifiedFirst [

	| object |
	object := MTAuxiliarSubclass1ForSubclassReplacementWithManySubclasses new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclassesModifiedSecond [

	| object |
	object := MTAuxiliarSubclass2ForSubclassReplacementWithManySubclasses new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodUsingClassWithManySubclassesModifiedThird [

	| object |
	object := MTAuxiliarSubclass3ForSubclassReplacementWithManySubclasses new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodWithOneSender [

	| object |
	object := MTAuxiliarClassForSubclassReplacementOperator new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodWithOneSenderModified [

	| object |
	object := MTAuxiliarSubclassForSubclassReplacementOperator new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodWithTwoSenders [

	| object |
	object := MTAuxiliarClassForSubclassReplacementOperator new.
	object := MTAuxiliarClassForSubclassReplacementOperatorBis new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodWithTwoSendersModifiedFirst [

	| object |
	object := MTAuxiliarSubclassForSubclassReplacementOperator new.
	object := MTAuxiliarClassForSubclassReplacementOperatorBis new
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> methodWithTwoSendersModifiedSecond [

	| object |
	object := MTAuxiliarClassForSubclassReplacementOperator new.
	object := MTAuxiliarSubclassForSubclassReplacementOperatorBis new
]

{ #category : #asserts }
MTSubclassReplacementOperatorTest >> newNodeFirstSubclass [

	^ RBVariableNode named:
		  MTAuxiliarSubclass1ForSubclassReplacementWithManySubclasses name
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> newNodeOneSender [

	^ RBVariableNode named:
		  MTAuxiliarSubclassForSubclassReplacementOperator name
]

{ #category : #asserts }
MTSubclassReplacementOperatorTest >> newNodeSecondSubclass [

	^ RBVariableNode named:
		  MTAuxiliarSubclass2ForSubclassReplacementWithManySubclasses name
]

{ #category : #asserts }
MTSubclassReplacementOperatorTest >> newNodeThirdSubclass [

	^ RBVariableNode named:
		  MTAuxiliarSubclass3ForSubclassReplacementWithManySubclasses name
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> newNodeTwoSendersFirst [

	^ RBVariableNode named:
		  MTAuxiliarSubclassForSubclassReplacementOperator name
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> newNodeTwoSendersSecond [

	^ RBVariableNode named:
		  MTAuxiliarSubclassForSubclassReplacementOperatorBis name
]

{ #category : #accessing }
MTSubclassReplacementOperatorTest >> operator [

	^ MTSubclassReplacementOperator new
]

{ #category : #tests }
MTSubclassReplacementOperatorTest >> testSubclassReplacementWithManySubclasses [

	self assert: self
			assertApplyingMutantWithFirstSubclassInClassWithManySubclassesMethod.
	self assert: self
			assertApplyingMutantWithSecondSubclassInClassWithManySubclassesMethod.
	self assert: self
			assertApplyingMutantWithThirdSubclassInClassWithManySubclassesMethod
]
