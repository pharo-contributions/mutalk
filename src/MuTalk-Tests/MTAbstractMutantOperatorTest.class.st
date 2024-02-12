Class {
	#name : 'MTAbstractMutantOperatorTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTAbstractMutantOperatorTest class >> isAbstract [

	^ self == MTAbstractMutantOperatorTest
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [

	^ self subclassResponsibility
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [

	^ self subclassResponsibility
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertApplyingMutantToNonSenderMethod [

	^ self subclassResponsibility
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [

	^ self subclassResponsibility
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertNumberMutantsGeneratedForNonSenderMethod [

	| mutationsGenerated |
	mutationsGenerated := self operator mutationsFor:
		                      self class >> #methodWithNoSenders.
	^ mutationsGenerated isEmpty
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertNumberMutantsGeneratedForOneSenderMethod [

	| mutationsGenerated |
	mutationsGenerated := self operator mutationsFor:
		                      self class >> #methodWithOneSender.
	^ mutationsGenerated size = 1
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertNumberMutantsGeneratedForTwoSendersMethod [

	| mutationsGenerated |
	mutationsGenerated := self operator mutationsFor:
		                      self class >> #methodWithTwoSenders.
	^ mutationsGenerated size = 2
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertTimesToApplyOperatorInTwoSendersMethod [

	^ (self operator timesToApplyIn: self class >> #methodWithTwoSenders)
	  = 2
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertTimesToApplyOperatorToNonSenderMethod [

	^ (self operator timesToApplyIn: self class >> #methodWithNoSenders)
	  = 0
]

{ #category : 'asserts' }
MTAbstractMutantOperatorTest >> assertTimesToApplyOperatorToOneSenderMethod [

	^ (self operator timesToApplyIn: self class >> #methodWithOneSender)
	  = 1
]

{ #category : 'formatting' }
MTAbstractMutantOperatorTest >> compareSource: aSource withSourceInMethod: aCompiledMethod replacingSelector: aSelector [
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
MTAbstractMutantOperatorTest >> formattedStringFor: aMethodString [

	^ (RBParser parseMethod: aMethodString) formattedCode
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> methodWithNoSenders [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> methodWithOneSender [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> methodWithOneSenderModified [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> methodWithTwoSenders [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> operator [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTAbstractMutantOperatorTest >> operatorDescription [

	^ self operator description
]
