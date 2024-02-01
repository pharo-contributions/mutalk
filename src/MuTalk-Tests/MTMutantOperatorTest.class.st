Class {
	#name : 'MTMutantOperatorTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTMutantOperatorTest class >> isAbstract [

	^ self == MTMutantOperatorTest
]

{ #category : 'accessing' }
MTMutantOperatorTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [
	^ self compareSource: 
				(self operator 
						modifiedSourceFor: self class >> #methodWithOneSender
						number: 1) 
			withSourceInMethod: self class >> #methodWithOneSenderModified
			replacingSelector: #methodWithOneSender
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedFirst
		replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertApplyingMutantToNonSenderMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithNoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithNoSenders
		replacingSelector: #methodWithNoSenders
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 2) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedSecond
		replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertNumberMutantsGeneratedForNonSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithNoSenders.
	^mutationsGenerated size = 0.
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertNumberMutantsGeneratedForOneSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithOneSender.
	^mutationsGenerated size = 1.
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertNumberMutantsGeneratedForTwoSendersMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithTwoSenders.
	^mutationsGenerated size = 2.
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertTimesToApplyOperatorInTwoSendersMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithTwoSenders) = 2
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertTimesToApplyOperatorToNonSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithNoSenders) = 0
]

{ #category : 'asserts' }
MTMutantOperatorTest >> assertTimesToApplyOperatorToOneSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithOneSender) = 1
]

{ #category : 'formatting' }
MTMutantOperatorTest >> compareSource: aSource withSourceInMethod: aCompiledMethod replacingSelector: aSelector [
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
MTMutantOperatorTest >> formattedStringFor: aMethodString [ 
	^ (RBParser parseMethod: aMethodString) formattedCode
]

{ #category : 'accessing' }
MTMutantOperatorTest >> methodWithNoSenders [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantOperatorTest >> methodWithOneSender [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantOperatorTest >> methodWithOneSenderModified [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantOperatorTest >> methodWithTwoSenders [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantOperatorTest >> operator [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantOperatorTest >> operatorDescription [

	^ self operator description
]

{ #category : 'tests' }
MTMutantOperatorTest >> testApplyMutantToMethod [
	self assert: self assertApplyingMutantToNonSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInTwoSendersMethod.
	self assert: self assertApplyingMutantToSecondSenderInTwoSendersMethod
]

{ #category : 'tests' }
MTMutantOperatorTest >> testNumberMutantsGenerated [
	self assert: self assertNumberMutantsGeneratedForNonSenderMethod.
	self assert: self assertNumberMutantsGeneratedForOneSenderMethod.
	self assert: self assertNumberMutantsGeneratedForTwoSendersMethod
]

{ #category : 'tests' }
MTMutantOperatorTest >> testPrintingAccessors [

	self
		assert: self operator description
		equals: self operatorDescription
]

{ #category : 'tests' }
MTMutantOperatorTest >> testTimesToApplyMutantToMethod [
	self assert: self assertTimesToApplyOperatorToNonSenderMethod.
	self assert: self assertTimesToApplyOperatorToOneSenderMethod.
	self assert: self assertTimesToApplyOperatorInTwoSendersMethod
]
