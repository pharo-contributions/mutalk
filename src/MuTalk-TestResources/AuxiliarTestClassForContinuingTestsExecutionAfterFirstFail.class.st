Class {
	#name : 'AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail',
	#superclass : 'TestCase',
	#classInstVars : [
		'counter'
	],
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'accessing' }
AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> counter [

	^ counter
]

{ #category : 'accessing' }
AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> counter: anObject [

	counter := anObject
]

{ #category : 'accessing' }
AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> increment [

	counter := counter + 1
]

{ #category : 'accessing' }
AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> reset [

	counter := 0
]

{ #category : 'tests' }
AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testA [

	self class increment.
	self assert: self class counter < 4
]

{ #category : 'tests' }
AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testB [

	self class increment.
	self assert: self class counter < 4
]

{ #category : 'tests' }
AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testC [

	self class increment.
	self assert: self class counter < 4
]
