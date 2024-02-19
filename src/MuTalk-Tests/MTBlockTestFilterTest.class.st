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
MTBlockTestFilterTest >> testYTestIsExcluded [

	| result |
	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'testX' ].
	result := analysis generalResult particularResults at: 1.

	self assert: result runCount equals: 1.
	self assert: (result mutantResults at: 1) selector equals: #testX
]

{ #category : 'tests' }
MTBlockTestFilterTest >> testYTestIsNotExcluded [

	self runAnalysisForBlockCondition: [ :testCase |
		testCase selector beginsWith: 'test' ].

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]
