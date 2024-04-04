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
		on: {  }
		withTests: { MTAuxiliarTestClassForTimeTestFilter }
]

{ #category : 'tests' }
MTTimeTestFilterTest >> testWith10MillisecondsCondition [

	| testCaseReference testCase |
	testCase := MTAuxiliarTestClassForTimeTestFilter selector:
		            #test10Milliseconds.
	testCaseReference := MTTestCaseReference for: testCase.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.

	self assert: analysis testCases size equals: 1.
	self
		assert: (analysis testCases at: 1) selector
		equals: #test10Milliseconds
]

{ #category : 'tests' }
MTTimeTestFilterTest >> testWith1SecondCondition [

	| testCaseReference testCase |
	testCase := MTAuxiliarTestClassForTimeTestFilter selector:
		            #test1Second.
	testCaseReference := MTTestCaseReference for: testCase.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.

	self assert: analysis testCases size equals: 2
]

{ #category : 'accessing' }
MTTimeTestFilterTest >> timeToRunFor: aTestCaseReference [

	aTestCaseReference run.
	^ aTestCaseReference lastTimeToRun
]
