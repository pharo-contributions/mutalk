Class {
	#name : 'MTRedTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTRedTestFilterTest >> runAnalysis [

	self
		runAnalysisWithFilter: MTRedTestFilter new
		on: {  }
		withTests: { MTAuxiliarTestClassForRedTestFilter }
]

{ #category : 'tests' }
MTRedTestFilterTest >> testRedTestIsExcluded [

	self runAnalysis.

	self assert: analysis testCases size equals: 1.
	self assert: (analysis testCases includes: (MTTestCaseReference for:
				  (MTAuxiliarTestClassForRedTestFilter selector: #testWithoutError)))
]
