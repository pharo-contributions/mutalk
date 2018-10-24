Class {
	#name : #MutantGenerationStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MutantGenerationStrategyTest >> testSelectingFromCoverageMutationsGenerationShouldOnlyMutateCoveredMethods [
	| classes mutationTestingAnalysis operator |
	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	mutationTestingAnalysis := MutationTestingAnalysis 
		for: (MutationTestingAnalysis testCasesReferencesFrom: AuxiliarTestClassForTestingStrategies)
		mutating: classes
		using: (Set with: operator)
		with: AllTestsMethodsRunningMutantEvaluationStrategy new
		with: SelectingFromCoverageMutationsGenerationStrategy new.
	mutationTestingAnalysis run.
	self assert: ((mutationTestingAnalysis mutations collect: [ :each | each originalMethod selector ]) includes: #method1).
	self deny: ((mutationTestingAnalysis mutations collect: [ :each | each originalMethod selector ]) includes: #aNotCoveredMethod)
]
