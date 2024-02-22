Class {
	#name : 'MTPragmaRejectionTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTPragmaRejectionTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector [

	self
		runAnalysisWithFilter:
		(MTPragmaRejectionTestFilter for: aPragmaSelector)
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'running' }
MTPragmaRejectionTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector andArguments: pragmaArguments [

	self
		runAnalysisWithFilter: (MTPragmaRejectionTestFilter
				 for: aPragmaSelector
				 arguments: pragmaArguments)
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'tests' }
MTPragmaRejectionTestFilterTest >> testTestWithPragmaIsExcluded [

	| result |
	self runAnalysisForPragmaCondition: #aPragma.
	result := analysis generalResult particularResults at: 1.

	self assert: result runCount equals: 1.
	self
		assert: (result mutantResults at: 1) selector
		equals: #testWithoutPragma
]

{ #category : 'tests' }
MTPragmaRejectionTestFilterTest >> testTestWithPragmaIsNotExcluded [

	self runAnalysisForPragmaCondition: #anotherPragma.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]

{ #category : 'tests' }
MTPragmaRejectionTestFilterTest >> testTestWithPragmaIsNotExcluded2 [

	self runAnalysisForPragmaCondition: #aPragma: andArguments: 'arg'.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]
