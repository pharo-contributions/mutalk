Class {
	#name : 'MTExtremeTransformationOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTExtremeTransformationOperatorTest >> methodWithOneSender [

	self operator.
	self operatorDescription 
]

{ #category : 'accessing' }
MTExtremeTransformationOperatorTest >> methodWithOneSenderModified [

	
]

{ #category : 'accessing' }
MTExtremeTransformationOperatorTest >> operator [

	^ ExtremeTransformationOperator new
]

{ #category : 'accessing' }
MTExtremeTransformationOperatorTest >> operatorDescription [

	^ self operator  description
]

{ #category : 'tests' }
MTExtremeTransformationOperatorTest >> testApplyMutantToMethod [

	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod
]

{ #category : 'tests' }
MTExtremeTransformationOperatorTest >> testNumberMutantsGenerated [

	self assert: self assertNumberMutantsGeneratedForOneSenderMethod
]

{ #category : 'tests' }
MTExtremeTransformationOperatorTest >> testTimesToApplyMutantToMethod [

	self assert: self assertTimesToApplyOperatorToOneSenderMethod
]
