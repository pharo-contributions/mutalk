Class {
	#name : 'TestSelectionStrategyTest',
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
TestSelectionStrategyTest class >> isAbstract [
	^ true
]

{ #category : 'accessing' }
TestSelectionStrategyTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
TestSelectionStrategyTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : 'asserting' }
TestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self subclassResponsibility
]

{ #category : 'asserting' }
TestSelectionStrategyTest >> assertMutantNotInCoverage [
	self subclassResponsibility
]

{ #category : 'asserting' }
TestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [

	self subclassResponsibility
]

{ #category : 'running' }
TestSelectionStrategyTest >> getTestsCasesToEvaluateForMutant: aMethodSelector [
	| mutation |
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> aMethodSelector) asOrderedCollection first.
	^ evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.

]

{ #category : 'configuring' }
TestSelectionStrategyTest >> selectionStrategy [
	^ self subclassResponsibility
]

{ #category : 'running' }
TestSelectionStrategyTest >> setUp [

	super setUp.
	resource := MutationTestingResource current.

	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	evaluationStrategy := self selectionStrategy new.
	testCasesUsed := AuxiliarTestClassForTestingStrategies suite tests.
	mutationTestingAnalysis := MutationTestingAnalysisBuilder new
		                           testCases: testCasesUsed;
		                           classesToMutate: classes;
		                           operators: (Set with: operator);
		                           testSelectionStrategy: evaluationStrategy;
		                           buildAnalysis.
	mutationTestingAnalysis generateCoverageAnalysis
]

{ #category : 'test' }
TestSelectionStrategyTest >> testMutantInCoverageOfTestCase [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantInCoverageOfTestCase
]

{ #category : 'test' }
TestSelectionStrategyTest >> testMutantNotInCoverage [

	testCases := self getTestsCasesToEvaluateForMutant: #aNotCoveredMethod.
	^ self assertMutantNotInCoverage
]

{ #category : 'test' }
TestSelectionStrategyTest >> testMutantNotInCoverageOfTest [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantNotInCoverageOfTest
]
