Class {
	#name : #MTAuxiliarClassForMTAnalysisTest,
	#superclass : #TestCase,
	#category : 'MuTalk-TestResources'
}

{ #category : #testing }
MTAuxiliarClassForMTAnalysisTest >> testAnotherMethodWithOneIfFalseSender [

	self
		assert:
		MTAuxiliarClassForMTAnalysis new anotherMethodWithOneIfFalseSender
		equals: 1
]

{ #category : #testing }
MTAuxiliarClassForMTAnalysisTest >> testClassMethodThatSendsSelect [

	self assert:
		MTAuxiliarClassForMTAnalysis classMethodThatSendsSelect notEmpty
]

{ #category : #testing }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithOneIfFalseSender [

	self
		assert: MTAuxiliarClassForMTAnalysis new methodWithOneIfFalseSender
		equals: 2
]

{ #category : #testing }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithOneIfTrueSender [

	self
		assert: MTAuxiliarClassForMTAnalysis new methodWithOneIfTrueSender
		equals: 1
]

{ #category : #testing }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithOnePlusSender [

	self
		assert: MTAuxiliarClassForMTAnalysis new methodWithOnePlusSender
		equals: 3
]

{ #category : #testing }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithTwoMinusSenders [

	self
		assert: MTAuxiliarClassForMTAnalysis new methodWithTwoMinusSenders
		equals: -4
]
