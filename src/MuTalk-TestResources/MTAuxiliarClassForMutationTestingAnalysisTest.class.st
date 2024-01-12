Class {
	#name : 'MTAuxiliarClassForMutationTestingAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'testing' }
MTAuxiliarClassForMutationTestingAnalysisTest >> testAnotherMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new anotherMethodWithOneIfFalseSender = 1
]

{ #category : 'testing' }
MTAuxiliarClassForMutationTestingAnalysisTest >> testClassMethodThatSendsSelect [
	self assert: AuxiliarClassForMutationTestingAnalysis classMethodThatSendsSelect notEmpty
]

{ #category : 'testing' }
MTAuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfFalseSender = 2
]

{ #category : 'testing' }
MTAuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOneIfTrueSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfTrueSender = 1
]

{ #category : 'testing' }
MTAuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOnePlusSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOnePlusSender = 3
]

{ #category : 'testing' }
MTAuxiliarClassForMutationTestingAnalysisTest >> testMethodWithTwoMinusSenders [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithTwoMinusSenders = -4
]
