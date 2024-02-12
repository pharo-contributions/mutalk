Class {
	#name : 'MTParseRewriterMutantOperatorTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTParseRewriterMutantOperatorTest class >> isAbstract [

	^ self == MTParseRewriterMutantOperatorTest
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithOneSender
				   number: 1)
		  withSourceInMethod: self class >> #methodWithOneSenderModified
		  replacingSelector: #methodWithOneSender
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 1)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedFirst
		  replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToNonSenderMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithNoSenders
				   number: 1)
		  withSourceInMethod: self class >> #methodWithNoSenders
		  replacingSelector: #methodWithNoSenders
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 2)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedSecond
		  replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertNumberMutantsGeneratedForNonSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithNoSenders.
	^mutationsGenerated size = 0.
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertNumberMutantsGeneratedForOneSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithOneSender.
	^mutationsGenerated size = 1.
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertNumberMutantsGeneratedForTwoSendersMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithTwoSenders.
	^mutationsGenerated size = 2.
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertTimesToApplyOperatorInTwoSendersMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithTwoSenders) = 2
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertTimesToApplyOperatorToNonSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithNoSenders) = 0
]

{ #category : 'asserts' }
MTParseRewriterMutantOperatorTest >> assertTimesToApplyOperatorToOneSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithOneSender) = 1
]

{ #category : 'formatting' }
MTParseRewriterMutantOperatorTest >> compareSource: aSource withSourceInMethod: aCompiledMethod replacingSelector: aSelector [
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
MTParseRewriterMutantOperatorTest >> formattedStringFor: aMethodString [ 
	^ (RBParser parseMethod: aMethodString) formattedCode
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> methodWithNoSenders [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> methodWithOneSender [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> methodWithOneSenderModified [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> methodWithTwoSenders [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> operator [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTParseRewriterMutantOperatorTest >> operatorDescription [

	^ self operator description
]

{ #category : 'tests' }
MTParseRewriterMutantOperatorTest >> testApplyMutantToMethod [
	self assert: self assertApplyingMutantToNonSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInTwoSendersMethod.
	self assert: self assertApplyingMutantToSecondSenderInTwoSendersMethod
]

{ #category : 'tests' }
MTParseRewriterMutantOperatorTest >> testNumberMutantsGenerated [
	self assert: self assertNumberMutantsGeneratedForNonSenderMethod.
	self assert: self assertNumberMutantsGeneratedForOneSenderMethod.
	self assert: self assertNumberMutantsGeneratedForTwoSendersMethod
]

{ #category : 'tests' }
MTParseRewriterMutantOperatorTest >> testPrintingAccessors [

	self
		assert: self operator description
		equals: self operatorDescription
]

{ #category : 'tests' }
MTParseRewriterMutantOperatorTest >> testTimesToApplyMutantToMethod [
	self assert: self assertTimesToApplyOperatorToNonSenderMethod.
	self assert: self assertTimesToApplyOperatorToOneSenderMethod.
	self assert: self assertTimesToApplyOperatorInTwoSendersMethod
]
