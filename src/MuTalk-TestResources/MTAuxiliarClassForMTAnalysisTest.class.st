Class {
	#name : 'MTAuxiliarClassForMTAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'testing' }
MTAuxiliarClassForMTAnalysisTest >> testAnotherMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new anotherMethodWithOneIfFalseSender = 1
]

{ #category : 'testing' }
MTAuxiliarClassForMTAnalysisTest >> testClassMethodThatSendsSelect [
	self assert: AuxiliarClassForMutationTestingAnalysis classMethodThatSendsSelect notEmpty
]

{ #category : 'testing' }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfFalseSender = 2
]

{ #category : 'testing' }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithOneIfTrueSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfTrueSender = 1
]

{ #category : 'testing' }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithOnePlusSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOnePlusSender = 3
]

{ #category : 'testing' }
MTAuxiliarClassForMTAnalysisTest >> testMethodWithTwoMinusSenders [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithTwoMinusSenders = -4
]
