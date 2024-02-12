Class {
	#name : 'MTPredicateBasedMutantOperatorTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTPredicateBasedMutantOperatorTest class >> isAbstract [

	^ self == MTPredicateBasedMutantOperatorTest
]

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
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

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertNumberMutantsGeneratedForNonSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithNoSenders.
	^mutationsGenerated size = 0.
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertNumberMutantsGeneratedForOneSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithOneSender.
	^mutationsGenerated size = 1.
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertNumberMutantsGeneratedForTwoSendersMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithTwoSenders.
	^mutationsGenerated size = 2.
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertTimesToApplyOperatorInTwoSendersMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithTwoSenders) = 2
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertTimesToApplyOperatorToNonSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithNoSenders) = 0
]

{ #category : 'asserts' }
MTPredicateBasedMutantOperatorTest >> assertTimesToApplyOperatorToOneSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithOneSender) = 1
]

{ #category : 'formatting' }
MTPredicateBasedMutantOperatorTest >> compareSource: aSource withSourceInMethod: aCompiledMethod replacingSelector: aSelector [
	"Compare both source replacing the selector of CompiledMethod for aSelector (to make then equal) 
	and formatting both sources equally."

	| sourceSelector secondString methodSelectorString secondStringModified |
	sourceSelector := aSelector asString.
	secondString := aCompiledMethod sourceCode asString.
	methodSelectorString := aCompiledMethod selector asString.
	secondStringModified := secondString
		copyReplaceAll: methodSelectorString
		with: sourceSelector.
	^ (self formattedStringFor: aSource)
		= (self formattedStringFor: secondStringModified)
]

{ #category : 'formatting' }
MTPredicateBasedMutantOperatorTest >> formattedStringFor: aMethodString [ 
	^ (RBParser parseMethod: aMethodString) formattedCode
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

{ #category : 'accessing' }
MTPredicateBasedMutantOperatorTest >> operatorDescription [

	^ self operator description
]

{ #category : 'tests' }
MTPredicateBasedMutantOperatorTest >> testApplyMutantToMethod [
	self assert: self assertApplyingMutantToNonSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInTwoSendersMethod.
	self assert: self assertApplyingMutantToSecondSenderInTwoSendersMethod
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
