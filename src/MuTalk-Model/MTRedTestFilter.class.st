Class {
	#name : 'MTRedTestFilter',
	#superclass : 'MTTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTRedTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCase |
		  self failuresOrErrorsIn: testCase ]
]

{ #category : 'accessing' }
MTRedTestFilter >> filteredTestReason [

	^ 'Was initially failing, even without any mutant applied'
]

{ #category : 'enumerating' }
MTRedTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCase |
		  self failuresOrErrorsIn: testCase ]
]
