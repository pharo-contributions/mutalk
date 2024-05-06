Class {
	#name : 'MTNonMutatedMethodsAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'tests' }
MTNonMutatedMethodsAnalysisTest >> testNonMutatedMethods [

	| analysis results |
	analysis := (MTNonMutatedMethodsAnalysis forClasses:
		             { MTAuxiliarClassForMatrix }) initializeMtAnalysis.
	analysis mtAnalysis operators: {
			MTReplacePlusWithMinusMutantOperator new.
			MTReplaceMinusWithPlusMutantOperator new }.
	results := analysis methodsWithoutMutation asSet.

	self assert: results equals: {
			(MTAuxiliarClassForMatrix >> #initialize).
			(MTAuxiliarClassForMatrix >> #reset) } asSet
]
