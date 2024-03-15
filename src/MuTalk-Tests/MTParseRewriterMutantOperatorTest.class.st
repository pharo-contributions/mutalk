Class {
	#name : #MTParseRewriterMutantOperatorTest,
	#superclass : #MTAbstractMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MTParseRewriterMutantOperatorTest class >> isAbstract [

	^ self == MTParseRewriterMutantOperatorTest
]

{ #category : #asserts }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithOneSender
				   number: 1)
		  withSourceInMethod: self class >> #methodWithOneSenderModified
		  replacingSelector: #methodWithOneSender
]

{ #category : #asserts }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 1)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedFirst
		  replacingSelector: #methodWithTwoSenders
]

{ #category : #asserts }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToNonSenderMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithNoSenders
				   number: 1)
		  withSourceInMethod: self class >> #methodWithNoSenders
		  replacingSelector: #methodWithNoSenders
]

{ #category : #asserts }
MTParseRewriterMutantOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [

	^ self
		  compareSource: (self operator
				   modifiedSourceFor: self class >> #methodWithTwoSenders
				   number: 2)
		  withSourceInMethod:
		  self class >> #methodWithTwoSendersModifiedSecond
		  replacingSelector: #methodWithTwoSenders
]

{ #category : #accessing }
MTParseRewriterMutantOperatorTest >> methodWithNoSenders [

	self subclassResponsibility
]

{ #category : #accessing }
MTParseRewriterMutantOperatorTest >> methodWithOneSender [

	self subclassResponsibility
]

{ #category : #accessing }
MTParseRewriterMutantOperatorTest >> methodWithOneSenderModified [

	self subclassResponsibility
]

{ #category : #accessing }
MTParseRewriterMutantOperatorTest >> methodWithTwoSenders [

	self subclassResponsibility
]

{ #category : #accessing }
MTParseRewriterMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	self subclassResponsibility
]

{ #category : #accessing }
MTParseRewriterMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	self subclassResponsibility
]

{ #category : #accessing }
MTParseRewriterMutantOperatorTest >> operator [

	self subclassResponsibility
]
