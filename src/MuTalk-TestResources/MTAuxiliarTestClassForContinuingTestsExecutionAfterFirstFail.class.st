Class {
	#name : #MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail,
	#superclass : #TestCase,
	#classInstVars : [
		'counter'
	],
	#category : 'MuTalk-TestResources'
}

{ #category : #accessing }
MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> counter [

	^ counter
]

{ #category : #accessing }
MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> counter: anObject [

	counter := anObject
]

{ #category : #accessing }
MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> increment [

	counter := counter + 1
]

{ #category : #accessing }
MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> reset [

	counter := 0
]

{ #category : #tests }
MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testA [

	self class increment.
	self assert: self class counter < 4
]

{ #category : #tests }
MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testB [

	self class increment.
	self assert: self class counter < 4
]

{ #category : #tests }
MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testC [

	self class increment.
	self assert: self class counter < 4
]
