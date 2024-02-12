Class {
	#name : 'MTPredicateBasedMutantOperatorTest',
	#superclass : 'MTAbstractMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTPredicateBasedMutantOperatorTest class >> isAbstract [

	^ self == MTPredicateBasedMutantOperatorTest
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithOneSender
				   number: 1
				   newExpression: self newNodeOneSender)
		  withSourceInMethod: self class >> #methodWithOneSenderModified
		  replacingSelector: #methodWithOneSender
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 1
				   newExpression: self newNodeTwoSendersFirst)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedFirst
		  replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertApplyingMutantToNonSenderMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithNoSenders
				   number: 1
				   newExpression: self newNodeOneSender)
		  withSourceInMethod: self class >> #methodWithNoSenders
		  replacingSelector: #methodWithNoSenders
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 2
				   newExpression: self newNodeTwoSendersSecond)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedSecond
		  replacingSelector: #methodWithTwoSenders
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> methodWithNoSenders [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> methodWithOneSender [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> methodWithOneSenderModified [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> methodWithTwoSenders [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> newNodeOneSender [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> newNodeTwoSendersFirst [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> newNodeTwoSendersSecond [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> operator [

	self subclassResponsibility
]

{ #category : 'tests' }
MTPredicateBasedMutantOperatorTest >> testApplyMutantToMethod [

	self assert: self assertApplyingMutantToNonSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInTwoSendersMethod.
	self assert:
		self assertApplyingMutantToSecondSenderInTwoSendersMethod
]

{ #category : 'tests' }
MTPredicateBasedMutantOperatorTest >> testNumberMutantsGenerated [

	self assert: self assertNumberMutantsGeneratedForNonSenderMethod.
	self assert: self assertNumberMutantsGeneratedForOneSenderMethod.
	self assert: self assertNumberMutantsGeneratedForTwoSendersMethod
]

{ #category : 'tests' }
MTPredicateBasedMutantOperatorTest >> testPrintingAccessors [

	self
		assert: self operator description
		equals: self operatorDescription
]

{ #category : 'tests' }
MTPredicateBasedMutantOperatorTest >> testTimesToApplyMutantToMethod [

	self assert: self assertTimesToApplyOperatorToNonSenderMethod.
	self assert: self assertTimesToApplyOperatorToOneSenderMethod.
	self assert: self assertTimesToApplyOperatorInTwoSendersMethod
]
