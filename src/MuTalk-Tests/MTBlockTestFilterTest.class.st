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
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarTestClassForBlockTestFilter }
]

{ #category : 'tests' }
MTBlockTestFilterTest >> testAllTestsAreExcluded [

	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'testZ' ].

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 0
]

{ #category : 'tests' }
MTBlockTestFilterTest >> testYTestsAreExcluded [

	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'testX' ].

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]

{ #category : 'tests' }
MTBlockTestFilterTest >> testYTestsAreNotExcluded [

	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'test' ].

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 4
]
