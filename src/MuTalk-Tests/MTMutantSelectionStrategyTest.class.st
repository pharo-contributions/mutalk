Class {
	#name : 'MTMutantSelectionStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTMutantSelectionStrategyTest >> testSelectingFromCoverageMutantSelectionShouldOnlyMutateCoveredMethods [

	| classes mutationTestingAnalysis operator |
	classes := OrderedCollection with: MTAuxiliarClassForTestingStrategies.
	operator := MTReplaceIfTrueWithIfFalseMutantOperator new.
	mutationTestingAnalysis := MTAnalysis new
		                           testClasses:
			                           { MTAuxiliarTestClassForTestingStrategies };
		                           classesToMutate: classes;
		                           operators: (Set with: operator);
		                           mutantSelectionStrategy:
			                           MTSelectingFromCoverageMutantSelectionStrategy
				                           new.
	mutationTestingAnalysis run.
	self assert: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #method1).
	self deny: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #aNotCoveredMethod)
]
