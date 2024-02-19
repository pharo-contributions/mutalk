Class {
	#name : 'MTPragmaTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTPragmaTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector [

	self
		runAnalysisWithFilter: (MTPragmaTestFilter for: aPragmaSelector)
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'running' }
MTPragmaTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector andArguments: pragmaArguments [

	self
		runAnalysisWithFilter:
		(MTPragmaTestFilter for: aPragmaSelector arguments: pragmaArguments)
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'tests' }
MTPragmaTestFilterTest >> testTestWithPragmaIsExcluded [

	| result |
	self runAnalysisForPragmaCondition: #aPragma.
	result := analysis generalResult particularResults at: 1.

	self assert: result runCount equals: 1.
	self
		assert: (result mutantResults at: 1) selector
		equals: #testWithoutPragma
]

{ #category : 'tests' }
MTPragmaTestFilterTest >> testTestWithPragmaIsNotExcluded [

	self runAnalysisForPragmaCondition: #anotherPragma.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]

{ #category : 'tests' }
MTPragmaTestFilterTest >> testTestWithPragmaIsNotExcluded2 [

	self runAnalysisForPragmaCondition: #aPragma: andArguments: 'arg'.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]
