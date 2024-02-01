Class {
	#name : 'MTTimeTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTTimeTestFilterTest >> runAnalysisForTimeCondition: aDuration [

	self
		runAnalysisWithFilter: (MTTimeTestFilter for: aDuration)
		on: { MTAuxiliarClassForTimeTestFilter }
		withTests: { MTAuxiliarClassForTimeTestFilterTest }
]

{ #category : 'running' }
MTTimeTestFilterTest >> testWith10MillisecondsCondition [

	| testCaseReference |
	testCaseReference := MTTestCaseReference
		                     for: #test10Milliseconds
		                     in: MTAuxiliarClassForTimeTestFilterTest.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 1
]

{ #category : 'running' }
MTTimeTestFilterTest >> testWith1SecondCondition [

	| testCaseReference |
	testCaseReference := MTTestCaseReference
		                     for: #test1Second
		                     in: MTAuxiliarClassForTimeTestFilterTest.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]

{ #category : 'running' }
MTTimeTestFilterTest >> timeToRunFor: aTestCaseReference [

	aTestCaseReference runUnchecked.
	^ aTestCaseReference lastTimeToRun
]
