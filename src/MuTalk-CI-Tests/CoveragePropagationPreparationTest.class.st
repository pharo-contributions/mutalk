"
A CoveragePropagationPreparationTest is a test class for testing the behavior of CoveragePropagationPreparation
"
Class {
	#name : 'CoveragePropagationPreparationTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'tests' }
CoveragePropagationPreparationTest >> testWorking [

	| analysis moreInfo mutant |
	analysis := MutationTestingAnalysisBuilder new
		            testClasses: { MutalkCIHelperTest };
		            classesToMutate: { MutalkCIHelper };
		            buildAnalysis.
	analysis run.

	moreInfo := CoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.
	self assert: moreInfo class equals: OrderedCollection.
	mutant := moreInfo detect: [ :item |
		          (item at: #mutationEvaluation) mutant operator class
		          = ReplacePlusWithMinusMutantOperator ].
	self assert: (mutant at: #coveredBy) isNotEmpty.
	self assert: (mutant at: #testStateChangedIn) isNotEmpty
]
