Class {
	#name : 'MTCIMarkdownExporterTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'as yet unclassified' }
MTCIMarkdownExporterTest >> testMarkdownExporter [

	| analysis md moreInfo |
	analysis := MTAnalysis new
		            testClasses: { MTSmallBankTest };
		            classesToMutate: { MTSmallBank }.
	analysis run.
	analysis generalResult.
	moreInfo := MTCoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.

	md := MTCIMarkdownExporter new
		      mtResult: analysis;
		      cloneLocation:
			      FileLocator localDirectory fullName
			      , '/iceberg/pharo-contributions/mutalk';
		      root: 'src';
		      export.
	
	self assert: md isString.
	self assert: md isNotEmpty.
]
