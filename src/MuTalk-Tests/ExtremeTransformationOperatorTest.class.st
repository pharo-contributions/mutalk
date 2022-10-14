Class {
	#name : #ExtremeTransformationOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : #'MuTalk-Tests'
}

{ #category : #accessing }
ExtremeTransformationOperatorTest >> methodWithOneSender [

	self operator.
	self operatorDescription 
]

{ #category : #accessing }
ExtremeTransformationOperatorTest >> methodWithOneSenderModified [

	
]

{ #category : #accessing }
ExtremeTransformationOperatorTest >> operator [

	^ ExtremeTransformationOperator new
]

{ #category : #accessing }
ExtremeTransformationOperatorTest >> operatorDescription [

	^ self operator  description
]

{ #category : #tests }
ExtremeTransformationOperatorTest >> testApplyMutantToMethod [

	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod
]

{ #category : #tests }
ExtremeTransformationOperatorTest >> testNumberMutantsGenerated [

	self assert: self assertNumberMutantsGeneratedForOneSenderMethod
]

{ #category : #tests }
ExtremeTransformationOperatorTest >> testTimesToApplyMutantToMethod [

	self assert: self assertTimesToApplyOperatorToOneSenderMethod
]
