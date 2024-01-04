Class {
	#name : 'MTBudgetTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTBudgetTest class >> isAbstract [

	^ self == MTBudgetTest
]

{ #category : 'running' }
MTBudgetTest >> runAnalysisFor: aBudget [

	^ self
		  runAnalysisWithBudget: aBudget
		  on: { AuxiliarClassForMutationTestingAnalysis }
		  withTests: { AuxiliarClassForMutationTestingAnalysisTest }
]

{ #category : 'running' }
MTBudgetTest >> runAnalysisWithBudget: aBudget on: classesToMutate withTests: testCases [

	analysis := MutationTestingAnalysisBuilder new
		            testClasses: testCases;
		            classesToMutate: classesToMutate;
		            budget: aBudget;
		            buildAnalysis.

	analysis run.
	^ analysis generalResult
]
