"
An ExtremeTransformationOperatorTest is a test class for testing the behavior of ExtremeTransformationOperator
"
Class {
	#name : #ExtremeTransformationOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : #'MuTalk-Tests'
}

{ #category : #accessing }
ExtremeTransformationOperatorTest >> methodWithOneSender [

	^ 1 + 2
]

{ #category : #accessing }
ExtremeTransformationOperatorTest >> methodWithOneSenderModified [

	
]

{ #category : #accessing }
ExtremeTransformationOperatorTest >> operator [

	^ ExtremeTransformationOperator new
]

{ #category : #testing }
ExtremeTransformationOperatorTest >> operatorDescription [

	^ self operator description 
]

{ #category : #tests }
ExtremeTransformationOperatorTest >> testApplyMutantToMethod [

	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod.
	
]

{ #category : #tests }
ExtremeTransformationOperatorTest >> testNumberMutantsGenerated [

]

{ #category : #tests }
ExtremeTransformationOperatorTest >> testTimesToApplyMutantToMethod [
]
