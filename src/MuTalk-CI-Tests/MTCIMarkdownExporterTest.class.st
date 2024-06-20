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
		            testClasses: { SmallBankTest };
		            classesToMutate: { SmallBank }.
	analysis run.
	analysis generalResult.
	moreInfo := MTCoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.

	md := MTCIMarkdownExporter new
		      mtResult: analysis;
		      cloneLocation:
			      FileLocator localDirectory fullName
			      , '/iceberg/mabdi/smalltalk-SmallBank';
		      root: 'src';
		      export.
	
	self assert: (Microdown asRichText: md) isText.
	self assert: (Microdown asRichText: md) isNotEmpty.
]
