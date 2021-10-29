"
A MutalkCITonelJsonExporterTest is a test class for testing the behavior of MutalkCITonelJsonExporter
"
Class {
	#name : #MutalkCITonelJsonExporterTest,
	#superclass : #TestCase,
	#category : #'MuTalk-CI-Tests'
}

{ #category : #tests }
MutalkCITonelJsonExporterTest >> testWorking [

	| analysis json |
	analysis := MutationTestingAnalysis
		            testCasesFrom: { SmallBankTest }
		            mutating: { SmallBank }
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningMutantEvaluationStrategy new.
	analysis run.

	json := MutalkCITonelJsonExporter new
		        mtResult: analysis;
		        cloneLocation: FileLocator localDirectory fullName
			        , '/iceberg/mabdi/smalltalk-smallbank';
		        root: 'src';
		        export.
	self assert: json class equals: '' class
]
