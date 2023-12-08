Class {
	#name : 'AuxiliarClassForMutationTestingAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'testing' }
AuxiliarClassForMutationTestingAnalysisTest >> testAnotherMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new anotherMethodWithOneIfFalseSender = 1
]

{ #category : 'testing' }
AuxiliarClassForMutationTestingAnalysisTest >> testClassMethodThatSendsSelect [
	self assert: AuxiliarClassForMutationTestingAnalysis classMethodThatSendsSelect notEmpty
]

{ #category : 'testing' }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfFalseSender = 2
]

{ #category : 'testing' }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOneIfTrueSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfTrueSender = 1
]

{ #category : 'testing' }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOnePlusSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOnePlusSender = 3
]

{ #category : 'testing' }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithTwoMinusSenders [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithTwoMinusSenders = -4
]
