Class {
	#name : 'MutantEvaluationStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource',
		'classes',
		'operator',
		'evaluationStrategy',
		'mutationTestingAnalysis',
		'testCases',
		'testCasesUsed'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MutantEvaluationStrategyTest class >> isAbstract [
	^ true
]

{ #category : 'accessing' }
MutantEvaluationStrategyTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MutantEvaluationStrategyTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : 'asserting' }
MutantEvaluationStrategyTest >> assertMutantInCoverageOfTestCase [
	self subclassResponsibility
]

{ #category : 'asserting' }
MutantEvaluationStrategyTest >> assertMutantNotInCoverage [
	self subclassResponsibility
]

{ #category : 'asserting' }
MutantEvaluationStrategyTest >> assertMutantNotInCoverageOfTest [
	self subclassResponsibility
]

{ #category : 'running' }
MutantEvaluationStrategyTest >> getTestsCasesToEvaluateForMutant: aMethodSelector [
	| mutation |
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> aMethodSelector) asOrderedCollection first.
	^ evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.

]

{ #category : 'configuring' }
MutantEvaluationStrategyTest >> selectionStrategy [
	^ self subclassResponsibility
]

{ #category : 'running' }
MutantEvaluationStrategyTest >> setUp [
	resource := MutationTestingResource current.
	
	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	evaluationStrategy := self selectionStrategy new.
	testCasesUsed := AuxiliarTestClassForTestingStrategies suite tests.
	mutationTestingAnalysis := MutationTestingAnalysis 
		for: testCasesUsed
		mutating: classes
		using: (Set with: operator)
		with: evaluationStrategy
		with: AllMutantSelectionStrategy new.
	mutationTestingAnalysis generateCoverageAnalysis.
]

{ #category : 'test' }
MutantEvaluationStrategyTest >> testMutantInCoverageOfTestCase [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantInCoverageOfTestCase
]

{ #category : 'test' }
MutantEvaluationStrategyTest >> testMutantNotInCoverage [

	testCases := self getTestsCasesToEvaluateForMutant: #aNotCoveredMethod.
	^ self assertMutantNotInCoverage
]

{ #category : 'test' }
MutantEvaluationStrategyTest >> testMutantNotInCoverageOfTest [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantNotInCoverageOfTest
]
