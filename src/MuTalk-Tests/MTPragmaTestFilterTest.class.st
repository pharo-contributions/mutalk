Class {
	#name : 'MTPragmaTestFilterTest',
	#superclass : 'MTTestFilterTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'as yet unclassified' }
MTPragmaTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector [

	self
		runAnalysisWithFilter: (MTPragmaTestFilter for: aPragmaSelector)
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarClassForPragmaTestFilterTest }
]

{ #category : 'as yet unclassified' }
MTPragmaTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector andArguments: pragmaArguments [

	self
		runAnalysisWithFilter:
		(MTPragmaTestFilter for: aPragmaSelector arguments: pragmaArguments)
		on: { MTAuxiliarClassForTestFilter }
		withTests: { MTAuxiliarClassForPragmaTestFilterTest }
]

{ #category : 'tests' }
MTPragmaTestFilterTest >> testTestWithPragmaIsExcluded [

	self runAnalysisForPragmaCondition: #aPragma.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 1
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
