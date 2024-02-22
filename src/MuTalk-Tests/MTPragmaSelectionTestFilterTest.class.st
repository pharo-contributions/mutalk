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
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'running' }
MTPragmaSelectionTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector andArguments: pragmaArguments [

	self
		runAnalysisWithFilter: (MTPragmaSelectionTestFilter
				 for: aPragmaSelector
				 arguments: pragmaArguments)
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'tests' }
MTPragmaSelectionTestFilterTest >> testAllTestsAreExcluded [

	self runAnalysisForPragmaCondition: #anotherPragma.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 0
]

{ #category : 'tests' }
MTPragmaSelectionTestFilterTest >> testAllTestsAreExcluded2 [

	self runAnalysisForPragmaCondition: #aPragma: andArguments: 'arg'.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 0
]

{ #category : 'tests' }
MTPragmaSelectionTestFilterTest >> testTestWithoutPragmaIsExcluded [

	| result |
	self runAnalysisForPragmaCondition: #aPragma.
	result := analysis generalResult particularResults at: 1.

	self assert: result runCount equals: 1.
	self
		assert: (result mutantResults at: 1) selector
		equals: #testWithPragma
]
