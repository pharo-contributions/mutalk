Class {
	#name : 'MutationTestingAnalysisBuilderTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
MutationTestingAnalysisBuilderTest >> testCustomParameters [

	| analysis |
	analysis := MutationTestingAnalysisBuilder new
		            testClasses:
			            { AuxiliarClassForMutationTestingAnalysisTest };
		            classesToMutate:
			            { AuxiliarClassForMutationTestingAnalysis };
		            operators:
			            (Set with: ReplaceIfTrueReceiverWithTrueOperator new);
		            mutantSelectionStrategy:
			            RandomMutantSelectionStrategy new;
		            testSelectionStrategy:
			            SelectingFromCoverageMutantSelectionStrategy new;
		            budget: (MTTimeBudget for: 10 seconds);
		            buildAnalysis.
	self
		assert: analysis modelClasses
		equals: (Array with: AuxiliarClassForMutationTestingAnalysis).
	self
		assert: (Set withAll: (analysis testCases collect: #method))
		equals:
		(Set withAll: AuxiliarClassForMutationTestingAnalysisTest methods).
	self
		assert: (analysis operators collect: [ :op | op species ])
		equals: (Set with: ReplaceIfTrueReceiverWithTrueOperator).
	self
		assert: analysis mutantSelectionStrategy species
		equals: RandomMutantSelectionStrategy.
	self
		assert: analysis testSelectionStrategy species
		equals: SelectingFromCoverageMutantSelectionStrategy.
	self assert: analysis budget species equals: MTTimeBudget
]

{ #category : 'tests' }
MutationTestingAnalysisBuilderTest >> testDefaultParameters [

	| analysis |
	analysis := MutationTestingAnalysisBuilder new buildAnalysis.
	self
		assert: (analysis operators collect: [ :op | op species ])
		equals: (MutantOperator contentsAll collect: [ :op | op species ]).
	self
		assert: analysis mutantSelectionStrategy species
		equals: AllMutantSelectionStrategy.
	self
		assert: analysis testSelectionStrategy species
		equals: AllTestsMethodsRunningTestSelectionStrategy.
	self assert: analysis budget species equals: MTFreeBudget
]
