Class {
	#name : 'MutantGenerationStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MutantGenerationStrategyTest >> testSelectingFromCoverageMutationsGenerationShouldOnlyMutateCoveredMethods [

	| classes mutationTestingAnalysis operator |
	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	mutationTestingAnalysis := MutationTestingAnalysisBuilder new
		                           testCases:
			                           (MutationTestingAnalysis
				                            testCasesReferencesFrom:
					                            AuxiliarTestClassForTestingStrategies);
		                           classesToMutate: classes;
		                           operators: (Set with: operator);
		                           mutantSelectionStrategy:
			                           SelectingFromCoverageMutantSelectionStrategy
				                           new;
		                           buildAnalysis.
	mutationTestingAnalysis run.
	self assert: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #method1).
	self deny: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #aNotCoveredMethod)
]
