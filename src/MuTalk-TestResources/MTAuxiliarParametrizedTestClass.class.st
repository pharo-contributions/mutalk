Class {
	#name : #MTAuxiliarParametrizedTestClass,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'number'
	],
	#category : 'MuTalk-TestResources'
}

{ #category : #'building suites' }
MTAuxiliarParametrizedTestClass class >> testParameters [

	^ ParametrizedTestMatrix new
		  forSelector: #number addOptions: { 1. 2. 3 };
		  yourself
]

{ #category : #accessing }
MTAuxiliarParametrizedTestClass >> number: aNumber [

	number := aNumber
]

{ #category : #testing }
MTAuxiliarParametrizedTestClass >> testAddZero [

	self assert: number + 0 equals: number
]
