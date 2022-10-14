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

	"requires https://github.com/mabdi/smalltalk-SmallBank"

	| analysis json moreInfo |
	
	self skip. 
	
	analysis := MutationTestingAnalysis
		            testCasesFrom: { SmallBankTest }
		            mutating: { SmallBank }
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningMutantEvaluationStrategy new.
	analysis run.
	moreInfo := CoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.
	json := MutalkCITonelJsonExporter new
		        mtResult: analysis;
		coverageInfo: moreInfo;
		        cloneLocation: FileLocator localDirectory fullName
			        , '/iceberg/mabdi/smalltalk-smallbank';
		        root: 'src';
		        export.
	self assert: json class equals: '' class
]
