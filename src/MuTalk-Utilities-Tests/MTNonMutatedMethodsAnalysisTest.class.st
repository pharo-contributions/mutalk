Class {
	#name : 'MTNonMutatedMethodsAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'tests' }
MTNonMutatedMethodsAnalysisTest >> testNonMutatedMethods [

	| testClasses nonMutatedMethods results |
	testClasses := 'MuTalk-Utilities-Tests' asPackage definedClasses
		               select: #isTestCase.
	nonMutatedMethods := testClasses
		                     inject: Set new
		                     into: [ :set :testClass |
			                     set addAll: testClass methods.
			                     set ].

	results := (MTNonMutatedMethodsAnalysis forPackages:
		            { 'MuTalk-Utilities-Tests' }) findMethodsWithoutMutation
		           asSet.

	self assert: nonMutatedMethods equals: results
]
