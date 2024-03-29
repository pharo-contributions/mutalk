Class {
	#name : 'MTNonMutatedMethodsAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'tests' }
MTNonMutatedMethodsAnalysisTest >> testNonMutatedMethods [

	| results |
	results := (MTNonMutatedMethodsAnalysis forClasses: {
			            MTAuxiliarClassForMatrix.
			            MTAuxiliarClassForMatrixTest })
		           methodsWithoutMutation asSet.

	self
		assert: results
		equals: MTAuxiliarClassForMatrixTest methods asSet
]
