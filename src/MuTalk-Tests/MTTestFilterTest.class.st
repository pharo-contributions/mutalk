Class {
	#name : #MTTestFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MTTestFilterTest class >> isAbstract [

	^ self == MTTestFilterTest
]

{ #category : #running }
MTTestFilterTest >> runAnalysisWithFilter: aTestFilter on: classesToMutate withTests: testCases [

	analysis := MTAnalysis new
		            testClasses: testCases;
		            classesToMutate: classesToMutate;
		            testFilter: aTestFilter.

	analysis run
]
