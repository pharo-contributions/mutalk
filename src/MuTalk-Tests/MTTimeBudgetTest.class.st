Class {
	#name : 'MTTimeBudgetTest',
	#superclass : 'MTBudgetTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTTimeBudgetTest >> fixedAnalysisTime [

	^ [ self runAnalysisFor: (MTTimeBudget for: 0 seconds) ] timeToRun
]

{ #category : 'tests' }
MTTimeBudgetTest >> runAnalysisForDuration: aDuration [

	^ self runAnalysisFor: (MTTimeBudget for: aDuration)
]

{ #category : 'running' }
MTTimeBudgetTest >> runAnalysisWithBudget: aBudget on: classesToMutate withTests: testCases [

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
MTTimeBudgetTest >> testWithNoTimeForMutantsRespectsDeadline [

	| duration analysisTime error fixedAnalysisTime |
	"Let's run the analysis for so much time that it will run the fixed cost (initial test run, coverage analysis) * N, making sure we will execute some mutants"
	fixedAnalysisTime := self fixedAnalysisTime.
	duration := fixedAnalysisTime / 4.
	analysisTime := [ self runAnalysisForDuration: duration ] timeToRun.

	"The analysis will always take at least the fixed time and not less"
	error := 0.2 seconds.
	self assert: analysisTime - fixedAnalysisTime <= error
]

{ #category : 'tests' }
MTTimeBudgetTest >> testWithNoTimeForMutantsRunsNoMutants [

	| duration analysisTime result |
	"Divide duration by 4 to make sure we never have time for mutants"
	duration := self fixedAnalysisTime / 4.
	analysisTime := [ result := self runAnalysisForDuration: duration ]
		                timeToRun.

	"We never treat mutants because the budget was exceeded running the initial test run, coverage analysis, etc"
	self assert: result numberOfEvaluatedMutants equals: 0
]

{ #category : 'tests' }
MTTimeBudgetTest >> testWithTimeForMutantsRespectsDeadline [

	| duration analysisTime error |
	"Let's run the analysis for so much time that it will run the fixed cost (initial test run, coverage analysis) * N, making sure we will execute some mutants"
	duration := self fixedAnalysisTime * 4.
	analysisTime := [ self runAnalysisForDuration: duration ] timeToRun.

	"Check if the analysis stopped after duration within the error"
	error := 0.2 seconds.
	self assert: analysisTime - duration <= error
]

{ #category : 'tests' }
MTTimeBudgetTest >> testWithTimeForMutantsRunsManyMutants [

	| duration analysisTime result |
	"Let's run the analysis for so much time that it will run the fixed cost (initial test run, coverage analysis) * N, making sure we will execute some mutants"
	duration := self fixedAnalysisTime * 4.
	analysisTime := [ result := self runAnalysisForDuration: duration ] timeToRun.

	"We expect that in the time we gave for the analysis we should have done more than one mutant"
	self assert: result numberOfEvaluatedMutants > 1
]
