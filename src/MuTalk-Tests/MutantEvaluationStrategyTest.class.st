Class {
	#name : #MutantEvaluationStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MutantEvaluationStrategyTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : #accessing }
MutantEvaluationStrategyTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : #building }
MutantEvaluationStrategyTest >> setUp [
	resource := MutationTestingResource current
]

{ #category : #testing }
MutantEvaluationStrategyTest >> testSelectingFromCoverageEvaluationStrategyShouldOnlyEvaluateSpecificTestCases [
	"tests that the message #testCasesToEvaluateFrom: returns only the test cases that cover the mutated code"
	| classes mutationTestingAnalysis testCases mutation operator evaluationStrategy |
	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	evaluationStrategy := SelectingFromCoverageMutantEvaluationStrategy new.
	mutationTestingAnalysis := MutationTestingAnalysis 
		for: AuxiliarTestClassForTestingStrategies suite tests
		mutating: classes
		using: (Set with: operator)
		with: evaluationStrategy
		with: AllMutationsGenerationStrategy new.
	mutationTestingAnalysis generateCoverageAnalysis.
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> #method1) asOrderedCollection first.
	testCases := evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.
	self assert: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod1).
	self deny: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod2)
]
