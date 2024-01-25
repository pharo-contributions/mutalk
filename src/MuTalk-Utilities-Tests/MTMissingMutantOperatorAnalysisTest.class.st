Class {
	#name : 'MTMissingMutantOperatorAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'tests' }
MTMissingMutantOperatorAnalysisTest >> testMissingMutantOperators [

	| testClasses nonMutatedMethods results |
	testClasses := 'MuTalk-Utilities-Tests' asPackage definedClasses
		               select: #isTestCase.
	nonMutatedMethods := testClasses
		                     inject: Set new
		                     into: [ :set :testClass |
			                     set addAll: testClass methods.
			                     set ].

	results := (MTMissingMutantOperatorAnalysis new
		            findMethodsWithoutMutationFor:
		            { 'MuTalk-Utilities-Tests' }) asSet.

	self assert: nonMutatedMethods equals: results
]
