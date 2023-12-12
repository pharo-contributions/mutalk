Class {
	#name : 'MutationTestingTimeBudgetTest',
	#superclass : 'MutationTestingBudgetTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MutationTestingTimeBudgetTest >> fixedAnalysisTime [

	^ [ self runAnalysisFor: 0 seconds ] timeToRun
]

{ #category : 'running' }
MutationTestingTimeBudgetTest >> runAnalysisFor: aDuration [

	^ self
		  runAnalysisWithBudget: (MutationTestingTimeBudget for: aDuration)
		  on: { AuxiliarClassForMutationTestingBudget }
		  withTests: { AuxiliarTestClassForMutationTestingBudget }
]

{ #category : 'running' }
MutationTestingTimeBudgetTest >> runAnalysisWithBudget: aBudget on: classesToMutate withTests: testCases [

	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with:
			            (ManualMutationSelectionStrategy with:
				             (Generator on: [ :gen |
					              [ true ] whileTrue: [ gen yield: NullMutation new ] ]))
		            budget: aBudget.

	analysis run.
	^ analysis generalResult
]

{ #category : 'tests' }
MutationTestingTimeBudgetTest >> testWithNoTimeForMutantsRespectsDeadline [

	| duration analysisTime error fixedAnalysisTime |
	"Let's run the analysis for so much time that it will run the fixed cost (initial test run, coverage analysis) * N, making sure we will execute some mutants"
	fixedAnalysisTime := self fixedAnalysisTime.
	duration := fixedAnalysisTime / 4.
	analysisTime := [ self runAnalysisFor: duration ] timeToRun.

	"The analysis will always take at least the fixed time and not less"
	error := 0.2 seconds.
	self assert: analysisTime - fixedAnalysisTime <= error
]

{ #category : 'tests' }
MutationTestingTimeBudgetTest >> testWithNoTimeForMutantsRunsNoMutants [

	| duration analysisTime result |
	"Divide duration by 4 to make sure we never have time for mutants"
	duration := self fixedAnalysisTime / 4.
	analysisTime := [ result := self runAnalysisFor: duration ] timeToRun.

	"We never treat mutants"
	self assert: result numberOfEvaluatedMutants equals: 0
]

{ #category : 'tests' }
MutationTestingTimeBudgetTest >> testWithTimeForMutantsRespectsDeadline [

	| duration analysisTime error |
	"Let's run the analysis for so much time that it will run the fixed cost (initial test run, coverage analysis) * N, making sure we will execute some mutants"
	duration := self fixedAnalysisTime * 4.
	analysisTime := [ self runAnalysisFor: duration ] timeToRun.

	"Check if the analysis stopped after duration within the error"
	error := 0.2 seconds.
	self assert: analysisTime - duration <= error
]

{ #category : 'tests' }
MutationTestingTimeBudgetTest >> testWithTimeForMutantsRunsManyMutants [

	| duration analysisTime result |
	"Let's run the analysis for so much time that it will run the fixed cost (initial test run, coverage analysis) * N, making sure we will execute some mutants"
	duration := self fixedAnalysisTime * 4.
	analysisTime := [ result := self runAnalysisFor: duration ] timeToRun.

	"We expect that in the time we gave for the analysis we should have done more than one mutant"
	self assert: result numberOfEvaluatedMutants > 1
]
