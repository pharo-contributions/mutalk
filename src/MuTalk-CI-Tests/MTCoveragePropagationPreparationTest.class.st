"
A CoveragePropagationPreparationTest is a test class for testing the behavior of CoveragePropagationPreparation
"
Class {
	#name : 'MTCoveragePropagationPreparationTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'tests' }
MTCoveragePropagationPreparationTest >> testWorking [

	| analysis moreInfo mutant |
	analysis := MutationTestingAnalysis new
		            testClasses: { MutalkCIHelperTest };
		            classesToMutate: { MutalkCIHelper }.
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
