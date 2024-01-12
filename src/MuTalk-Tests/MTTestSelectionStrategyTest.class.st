Class {
	#name : 'MTTestSelectionStrategyTest',
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
MTTestSelectionStrategyTest class >> isAbstract [
	^ true
]

{ #category : 'accessing' }
MTTestSelectionStrategyTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MTTestSelectionStrategyTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : 'asserting' }
MTTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self subclassResponsibility
]

{ #category : 'asserting' }
MTTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self subclassResponsibility
]

{ #category : 'asserting' }
MTTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [

	self subclassResponsibility
]

{ #category : 'running' }
MTTestSelectionStrategyTest >> getTestsCasesToEvaluateForMutant: aMethodSelector [
	| mutation |
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> aMethodSelector) asOrderedCollection first.
	^ evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.

]

{ #category : 'configuring' }
MTTestSelectionStrategyTest >> selectionStrategy [
	^ self subclassResponsibility
]

{ #category : 'running' }
MTTestSelectionStrategyTest >> setUp [

	super setUp.
	resource := MutationTestingResource current.

	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	evaluationStrategy := self selectionStrategy new.
	testCasesUsed := AuxiliarTestClassForTestingStrategies suite tests.
	mutationTestingAnalysis := MutationTestingAnalysis new
		                           testCases: testCasesUsed;
		                           classesToMutate: classes;
		                           operators: (Set with: operator);
		                           testSelectionStrategy: evaluationStrategy.
	mutationTestingAnalysis generateCoverageAnalysis
]

{ #category : 'test' }
MTTestSelectionStrategyTest >> testMutantInCoverageOfTestCase [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantInCoverageOfTestCase
]

{ #category : 'test' }
MTTestSelectionStrategyTest >> testMutantNotInCoverage [

	testCases := self getTestsCasesToEvaluateForMutant: #aNotCoveredMethod.
	^ self assertMutantNotInCoverage
]

{ #category : 'test' }
MTTestSelectionStrategyTest >> testMutantNotInCoverageOfTest [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantNotInCoverageOfTest
]
