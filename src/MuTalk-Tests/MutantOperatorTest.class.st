Class {
	#name : #MutantOperatorTest,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MutantOperatorTest class >> isAbstract [
	^ self name = #MutantOperatorTest
]

{ #category : #accessing }
MutantOperatorTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : #asserts }
MutantOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [
	^ self compareSource: 
				(self operator 
						modifiedSourceFor: self class >> #methodWithOneSender
						number: 1) 
			withSourceInMethod: self class >> #methodWithOneSenderModified
			replacingSelector: #methodWithOneSender
]

{ #category : #asserts }
MutantOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedFirst
		replacingSelector: #methodWithTwoSenders
]

{ #category : #asserts }
MutantOperatorTest >> assertApplyingMutantToNonSenderMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithNoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithNoSenders
		replacingSelector: #methodWithNoSenders
]

{ #category : #asserts }
MutantOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 2) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedSecond
		replacingSelector: #methodWithTwoSenders
]

{ #category : #asserts }
MutantOperatorTest >> assertNumberMutantsGeneratedForNonSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithNoSenders.
	^mutationsGenerated size = 0.
]

{ #category : #asserts }
MutantOperatorTest >> assertNumberMutantsGeneratedForOneSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithOneSender.
	^mutationsGenerated size = 1.
]

{ #category : #asserts }
MutantOperatorTest >> assertNumberMutantsGeneratedForTwoSendersMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithTwoSenders.
	^mutationsGenerated size = 2.
]

{ #category : #asserts }
MutantOperatorTest >> assertTimesToApplyOperatorInTwoSendersMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithTwoSenders) = 2
]

{ #category : #asserts }
MutantOperatorTest >> assertTimesToApplyOperatorToNonSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithNoSenders) = 0
]

{ #category : #asserts }
MutantOperatorTest >> assertTimesToApplyOperatorToOneSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithOneSender) = 1
]

{ #category : #formatting }
MutantOperatorTest >> compareSource: aSource withSourceInMethod: aCompiledMethod replacingSelector: aSelector [
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

{ #category : #formatting }
MutantOperatorTest >> formattedStringFor: aMethodString [ 
	^ (RBParser parseMethod: aMethodString) formattedCode
]

{ #category : #accessing }
MutantOperatorTest >> methodWithNoSenders [
	self subclassResponsibility
]

{ #category : #accessing }
MutantOperatorTest >> methodWithOneSender [
	self subclassResponsibility
]

{ #category : #accessing }
MutantOperatorTest >> methodWithOneSenderModified [

	self subclassResponsibility
]

{ #category : #accessing }
MutantOperatorTest >> methodWithTwoSenders [
	self subclassResponsibility
]

{ #category : #accessing }
MutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	self subclassResponsibility
]

{ #category : #accessing }
MutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	self subclassResponsibility
]

{ #category : #accessing }
MutantOperatorTest >> operator [
	self subclassResponsibility
]

{ #category : #testing }
MutantOperatorTest >> operatorDescription [
	self subclassResponsibility 
]

{ #category : #testing }
MutantOperatorTest >> testApplyMutantToMethod [
	self assert: self assertApplyingMutantToNonSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInTwoSendersMethod.
	self assert: self assertApplyingMutantToSecondSenderInTwoSendersMethod
]

{ #category : #testing }
MutantOperatorTest >> testNumberMutantsGenerated [
	self assert: self assertNumberMutantsGeneratedForNonSenderMethod.
	self assert: self assertNumberMutantsGeneratedForOneSenderMethod.
	self assert: self assertNumberMutantsGeneratedForTwoSendersMethod
]

{ #category : #testing }
MutantOperatorTest >> testPrintingAccessors [
	self assert: self operator description = self operatorDescription.
]

{ #category : #testing }
MutantOperatorTest >> testTimesToApplyMutantToMethod [
	self assert: self assertTimesToApplyOperatorToNonSenderMethod.
	self assert: self assertTimesToApplyOperatorToOneSenderMethod.
	self assert: self assertTimesToApplyOperatorInTwoSendersMethod
]
