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
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarClassForTimeTestFilterTest }
]

{ #category : 'tests' }
MTTimeTestFilterTest >> testWith10MillisecondsCondition [

	| testCaseReference result testCase |
	testCase := MTAuxiliarClassForTimeTestFilterTest selector:
		            #test10Milliseconds.
	testCaseReference := MTTestCaseReference for: testCase.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.
	result := analysis generalResult particularResults at: 1.

	self assert: result runCount equals: 1.
	self
		assert: (result mutantResults at: 1) selector
		equals: #test10Milliseconds
]

{ #category : 'tests' }
MTTimeTestFilterTest >> testWith1SecondCondition [

	| testCaseReference testCase |
	testCase := MTAuxiliarClassForTimeTestFilterTest selector:
		            #test1Second.
	testCaseReference := MTTestCaseReference for: testCase.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]

{ #category : 'accessing' }
MTTimeTestFilterTest >> timeToRunFor: aTestCaseReference [

	aTestCaseReference run.
	^ aTestCaseReference lastTimeToRun
]
