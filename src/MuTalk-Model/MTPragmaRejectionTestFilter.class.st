Class {
	#name : 'MTPragmaRejectionTestFilter',
	#superclass : 'MTPragmaTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'instance creation' }
MTPragmaRejectionTestFilter class >> for: aPragmaSelector [

	^ self new
		  condition: aPragmaSelector;
		  pragmaArguments: #(  );
		  yourself
]

{ #category : 'instance creation' }
MTPragmaRejectionTestFilter class >> for: aPragmaSelector arguments: pragmaArguments [

	^ self new
		  condition: aPragmaSelector;
		  pragmaArguments: pragmaArguments;
		  yourself
]

{ #category : 'enumerating' }
MTPragmaRejectionTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCaseReference |
		  self isPragmaValidFrom: testCaseReference ]
]
