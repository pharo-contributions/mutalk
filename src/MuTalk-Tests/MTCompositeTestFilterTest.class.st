Class {
	#name : 'MTCompositeTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTCompositeTestFilterTest >> runAnalysisWithFilters: aTestFilterCollection [

	self
		runAnalysisWithFilter:
		(MTCompositeTestFilter for: aTestFilterCollection)
		on: {  }
		withTests: { MTAuxiliarTestClassForCompositeTestFilter }
]

{ #category : 'tests' }
MTCompositeTestFilterTest >> testWithCombinedTestFilters [

	self runAnalysisWithFilters: {
			(MTBlockTestFilter for: [ :testCase |
				 testCase selector beginsWith: 'testX' ]).
			(MTPragmaSelectionTestFilter for: #pragma).
			(MTTimeTestFilter for: 10 milliSeconds) }.

	self assert: analysis testCases size equals: 1.
	self assert: (analysis testCases at: 1) selector equals: #testX1
]
