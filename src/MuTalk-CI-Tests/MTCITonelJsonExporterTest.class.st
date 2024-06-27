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

	| analysis json moreInfo repo |
	analysis := MTAnalysis new
		            testClasses: { MTSmallBankTest };
		            classesToMutate: { MTSmallBank }.
	analysis run.
	moreInfo := MTCoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.
	repo := IceRepository repositories detect: [ :aRepo |
		aRepo workingCopy packages anySatisfy: [ :package |
			package name = MTSmallBank package name ] ].

	json := MTCITonelJsonExporter new
		        mtResult: analysis;
		        coverageInfo: moreInfo;
		        cloneLocation: repo location fullName;
		        root: 'src';
		        export.
	self assert: json class equals: '' class
]
