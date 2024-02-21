Class {
	#name : 'MTPragmaSelectionTestFilter',
	#superclass : 'MTPragmaTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'instance creation' }
MTPragmaSelectionTestFilter class >> for: aPragmaSelector [

	^ self new
		  condition: aPragmaSelector;
		  pragmaArguments: #(  );
		  yourself
]

{ #category : 'instance creation' }
MTPragmaSelectionTestFilter class >> for: aPragmaSelector arguments: pragmaArguments [

	^ self new
		  condition: aPragmaSelector;
		  pragmaArguments: pragmaArguments;
		  yourself
]

{ #category : 'enumerating' }
MTPragmaSelectionTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCaseReference |
		  self isPragmaValidFrom: testCaseReference ]
]
