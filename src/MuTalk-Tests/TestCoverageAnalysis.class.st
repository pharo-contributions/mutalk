Class {
	#name : #TestCoverageAnalysis,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
TestCoverageAnalysis >> testBugWhenHavingATestResourceSendingToOther [
	"the problem was when sending from a resource a message to another object wich class is going to be considered for coverage"
	| analysis testCases|
	analysis := CoverageAnalysis
		for: (Array with: ClassForTestingCoverage with:TestResourceClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: ClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).


]

{ #category : #testing }
TestCoverageAnalysis >> testCoveredMethods [
	| analysis |
	analysis := CoverageAnalysis 
		for: (Array with: ClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	
	self assert: (analysis result coveredMethods includes: ClassForTestingCoverage >> #aCoveredMethod).
	self deny: (analysis result coveredMethods includes: ClassForTestingCoverage >> #anUncoveredMethod)
]

{ #category : #testing }
TestCoverageAnalysis >> testGettingTheTestCasesThatCoverAClassMethod [
	| analysis testCases|
	analysis := CoverageAnalysis
		for: (Array with: ClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: ClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).


]

{ #category : #testing }
TestCoverageAnalysis >> testGettingTheTestCasesThatCoverAMethod [
	| analysis testCases|

	analysis := CoverageAnalysis 
		for: (Array with: ClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: ClassForTestingCoverage >> #aCoveredMethod.
	self assert: ((testCases collect: [:each | each selector]) includes:#testCase1).
	self deny: ((testCases collect: [:each | each selector]) includes:#testCase3).
]
