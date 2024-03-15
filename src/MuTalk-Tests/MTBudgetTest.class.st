Class {
	#name : #MTBudgetTest,
	#superclass : #TestCase,
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MTBudgetTest class >> isAbstract [

	^ self == MTBudgetTest
]

{ #category : #running }
MTBudgetTest >> runAnalysisFor: aBudget [

	^ self
		  runAnalysisWithBudget: aBudget
		  on: { MTAuxiliarClassForMTAnalysis }
		  withTests: { MTAuxiliarClassForMTAnalysisTest }
]

{ #category : #running }
MTBudgetTest >> runAnalysisWithBudget: aBudget on: classesToMutate withTests: testCases [

	analysis := MTAnalysis new
		            testClasses: testCases;
		            classesToMutate: classesToMutate;
		            budget: aBudget.

	analysis run.
	^ analysis generalResult
]
