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
		on: {  }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'running' }
MTPragmaRejectionTestFilterTest >> runAnalysisForPragmaCondition: aPragmaSelector andArguments: pragmaArguments [

	self
		runAnalysisWithFilter: (MTPragmaRejectionTestFilter
				 for: aPragmaSelector
				 arguments: pragmaArguments)
		on: {  }
		withTests: { MTAuxiliarTestClassForPragmaTestFilter }
]

{ #category : 'tests' }
MTPragmaRejectionTestFilterTest >> testTestWithPragmaIsExcluded [

	self runAnalysisForPragmaCondition: #aPragma.


	self assert: analysis testCases size equals: 1.
	self
		assert: (analysis testCases at: 1) selector
		equals: #testWithoutPragma
]

{ #category : 'tests' }
MTPragmaRejectionTestFilterTest >> testTestWithPragmaIsNotExcluded [

	self runAnalysisForPragmaCondition: #anotherPragma.

	self assert: analysis testCases size equals: 2
]

{ #category : 'tests' }
MTPragmaRejectionTestFilterTest >> testTestWithPragmaIsNotExcluded2 [

	self runAnalysisForPragmaCondition: #aPragma: andArguments: 'arg'.

	self assert: analysis testCases size equals: 2
]
