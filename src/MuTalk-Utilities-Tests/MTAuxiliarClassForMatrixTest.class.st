Class {
	#name : 'MTAuxiliarClassForMatrixTest',
	#superclass : 'TestCase',
	#instVars : [
		'obj'
	],
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'running' }
MTAuxiliarClassForMatrixTest >> setUp [

	super setUp.
	obj := MTAuxiliarClassForMatrix new
]

{ #category : 'running' }
MTAuxiliarClassForMatrixTest >> testMinus [

	self assert: (obj minus: 10) equals: -10
]

{ #category : 'running' }
MTAuxiliarClassForMatrixTest >> testPlus [

	self assert: (obj plus: 10) equals: 10
]
