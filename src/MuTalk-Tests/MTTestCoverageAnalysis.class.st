Class {
	#name : #MTTestCoverageAnalysis,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MTTestCoverageAnalysis >> testBugWhenHavingATestResourceSendingToOther [
	"the problem was when sending from a resource a message to another object wich class is going to be considered for coverage"
	| analysis testCases|
	analysis := MTCoverageAnalysis
		for: (Array with: MTClassForTestingCoverage with:MTTestResourceClassForTestingCoverage)
		running: MTTestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: MTClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).


]

{ #category : #testing }
MTTestCoverageAnalysis >> testCoveredMethods [

	| analysis |
	analysis := MTCoverageAnalysis
		            for: (Array with: MTClassForTestingCoverage)
		            running: MTTestClassForTestingCoverage suite tests.
	analysis run.

	self assert: (analysis result coveredMethods includes:
			 MTClassForTestingCoverage >> #aCoveredMethod).
	self deny: (analysis result coveredMethods includes:
			 MTClassForTestingCoverage >> #anUncoveredMethod).
	self assert: (analysis result uncoveredMethods includes:
			 MTClassForTestingCoverage >> #anUncoveredMethod).
	self deny: (analysis result uncoveredMethods includes:
			 MTClassForTestingCoverage >> #aCoveredMethod).
	self deny: (analysis result uncoveredMethods includes:
			 MTClassForTestingCoverage >> #anUncoveredMethodSubClassResponsibility)		
]

{ #category : #testing }
MTTestCoverageAnalysis >> testGettingTheTestCasesThatCoverAClassMethod [
	| analysis testCases|
	analysis := MTCoverageAnalysis
		for: (Array with: MTClassForTestingCoverage)
		running: MTTestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: MTClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).


]

{ #category : #testing }
MTTestCoverageAnalysis >> testGettingTheTestCasesThatCoverAMethod [
	| analysis testCases|

	analysis := MTCoverageAnalysis 
		for: (Array with: MTClassForTestingCoverage)
		running: MTTestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: MTClassForTestingCoverage >> #aCoveredMethod.
	self assert: ((testCases collect: [:each | each selector]) includes:#testCase1).
	self deny: ((testCases collect: [:each | each selector]) includes:#testCase3).
]
