Class {
	#name : 'MTMutantGenerationStrategyTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTMutantGenerationStrategyTest >> testSelectingFromCoverageMutantGenerationShouldOnlyMutateCoveredMethods [

	| classes mutationTestingAnalysis operator |
	classes := OrderedCollection with: MTAuxiliarClassForTestingStrategies.
	operator := MTReplaceIfTrueWithIfFalseMutantOperator new.
	mutationTestingAnalysis := MTAnalysis new
		                           testClasses:
			                           { MTAuxiliarTestClassForTestingStrategies };
		                           classesToMutate: classes;
		                           operators: (Set with: operator);
		                           mutantGenerationStrategy:
			                           MTSelectingFromCoverageMutantGenerationStrategy
				                           new.
	mutationTestingAnalysis run.
	self assert: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #method1).
	self deny: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #aNotCoveredMethod)
]
