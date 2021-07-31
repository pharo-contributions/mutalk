Class {
	#name : #SelectingFromCoverageMutantEvaluationStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'resource',
		'classes',
		'operator',
		'evaluationStrategy',
		'mutationTestingAnalysis'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #accessing }
SelectingFromCoverageMutantEvaluationStrategyTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : #accessing }
SelectingFromCoverageMutantEvaluationStrategyTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : #building }
SelectingFromCoverageMutantEvaluationStrategyTest >> setUp [
	resource := MutationTestingResource current.
	
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
]

{ #category : #testing }
SelectingFromCoverageMutantEvaluationStrategyTest >> testMutantInCoverageOfTestCaseShouldBeEvaluated [
	"tests that the message #testCasesToEvaluateFrom: returns only the test cases that cover the mutated code"

	| mutation testCases |
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> #method1) asOrderedCollection first.
	testCases := evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.
	self assert: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod1).

]

{ #category : #testing }
SelectingFromCoverageMutantEvaluationStrategyTest >> testMutantInCoverageOfTestCaseShouldNotBeEvaluated [
	"tests that the message #testCasesToEvaluateFrom: returns only the test cases that cover the mutated code"

	| mutation testCases |
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> #method1) asOrderedCollection first.
	testCases := evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.
	self deny: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod2)

]

{ #category : #testing }
SelectingFromCoverageMutantEvaluationStrategyTest >> testMutantNotInCoverageShouldNotBeEvaluated [
	"tests that the message #testCasesToEvaluateFrom: returns only the test cases that cover the mutated code"

	| mutation testCases |
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> #aNotCoveredMethod) asOrderedCollection first.
	testCases := evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.
	self assert: testCases isEmpty

]
