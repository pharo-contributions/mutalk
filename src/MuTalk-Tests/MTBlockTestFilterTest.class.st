Class {
	#name : 'MTBlockTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTBlockTestFilterTest >> runAnalysisForBlockCondition: aBlock [

	self
		runAnalysisWithFilter: (MTBlockTestFilter for: aBlock)
		on: {  }
		withTests: { MTAuxiliarTestClassForBlockTestFilter }
]

{ #category : 'tests' }
MTBlockTestFilterTest >> testAllTestsAreExcluded [

	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'testZ' ].

	self assert: analysis testCases size equals: 0
]

{ #category : 'tests' }
MTBlockTestFilterTest >> testYTestIsExcluded [

	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'testX' ].

	self assert: analysis testCases size equals: 1.
	self assert: (analysis testCases at: 1) selector equals: #testX
]

{ #category : 'tests' }
MTBlockTestFilterTest >> testYTestIsNotExcluded [

	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'test' ].

	self assert: analysis testCases size equals: 2
]
