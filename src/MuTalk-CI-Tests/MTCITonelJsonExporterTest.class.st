"
A MutalkCITonelJsonExporterTest is a test class for testing the behavior of MutalkCITonelJsonExporter
"
Class {
	#name : 'MTCITonelJsonExporterTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'tests' }
MTCITonelJsonExporterTest >> testWorking [
	"requires https://github.com/mabdi/smalltalk-SmallBank"

	| analysis json moreInfo |
	self skip.

	analysis := MTAnalysis new
		            testClasses: { SmallBankTest };
		            classesToMutate: { SmallBank }.
	analysis run.
	moreInfo := MTCoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.
	json := MTCITonelJsonExporter new
		        mtResult: analysis;
		        coverageInfo: moreInfo;
		        cloneLocation: FileLocator localDirectory fullName
			        , '/iceberg/mabdi/smalltalk-smallbank';
		        root: 'src';
		        export.
	self assert: json class equals: '' class
]
