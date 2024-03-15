Class {
	#name : #MTEmptyMethodOperatorTest,
	#superclass : #MTPredicateBasedMutantOperatorTest,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTEmptyMethodOperatorTest >> methodWithOneSender [

	self operator.
	self operatorDescription 
]

{ #category : #accessing }
MTEmptyMethodOperatorTest >> methodWithOneSenderModified [

	
]

{ #category : #accessing }
MTEmptyMethodOperatorTest >> newNodeOneSender [

	^ RBSequenceNode statements: #(  )
]

{ #category : #accessing }
MTEmptyMethodOperatorTest >> operator [

	^ MTEmptyMethodOperator new
]

{ #category : #tests }
MTEmptyMethodOperatorTest >> testApplyMutantToMethod [

	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod
]

{ #category : #tests }
MTEmptyMethodOperatorTest >> testNumberMutantsGenerated [

	self assert: self assertNumberMutantsGeneratedForOneSenderMethod
]

{ #category : #tests }
MTEmptyMethodOperatorTest >> testTimesToApplyMutantToMethod [

	self assert: self assertTimesToApplyOperatorToOneSenderMethod
]
