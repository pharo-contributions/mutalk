Class {
	#name : 'MTRedTestFilter',
	#superclass : 'MTTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTRedTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCase |
		  self failuresOrErrorsIn: testCase lastResult ]
]

{ #category : 'testing' }
MTRedTestFilter >> resultsContainFailuresOrErrors: results [

	^ false
]
