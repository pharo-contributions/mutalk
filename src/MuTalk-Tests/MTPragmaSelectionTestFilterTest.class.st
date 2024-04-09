Class {
	#name : 'MTPragmaSelectionTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTPragmaSelectionTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector [

	self
		runAnalysisWithFilter:
		(MTPragmaSelectionTestFilter for: aPragmaSelector)
		on: {  }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'running' }
MTPragmaSelectionTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector andArguments: pragmaArguments [

	self
		runAnalysisWithFilter: (MTPragmaSelectionTestFilter
				 for: aPragmaSelector
				 arguments: pragmaArguments)
		on: {  }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'tests' }
MTPragmaSelectionTestFilterTest >> testAllTestsAreExcluded [

	self runAnalysisForPragmaCondition: #anotherPragma.

	self assert: analysis testCases size equals: 0
]

{ #category : 'tests' }
MTPragmaSelectionTestFilterTest >> testAllTestsAreExcluded2 [

	self runAnalysisForPragmaCondition: #aPragma: andArguments: { 'arg' }.

	self assert: analysis testCases size equals: 0
]

{ #category : 'tests' }
MTPragmaSelectionTestFilterTest >> testTestWithoutPragmaIsExcluded [

	self runAnalysisForPragmaCondition: #aPragma.


	self assert: analysis testCases size equals: 1.
	self
		assert: (analysis testCases at: 1) selector
		equals: #testWithPragma
]
