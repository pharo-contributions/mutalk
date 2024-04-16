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
	analysis := MTAnalysis new
		            testClasses: { MTCIHelperTest };
		            classesToMutate: { MTCIHelper };
		            budget: MTFreeBudget new.
	analysis run.

	moreInfo := MTCoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.
	self assert: moreInfo class equals: OrderedCollection.
	mutant := moreInfo detect: [ :item |
		          (item at: #mutationEvaluation) mutant operator class
		          = MTReplacePlusWithMinusMutantOperator ].
	self assert: (mutant at: #coveredBy) isNotEmpty.
	self assert: (mutant at: #testStateChangedIn) isNotEmpty
]
