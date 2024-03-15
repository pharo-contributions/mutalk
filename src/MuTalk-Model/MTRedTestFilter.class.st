Class {
	#name : #MTRedTestFilter,
	#superclass : #MTTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTRedTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCase |
		  self failuresOrErrorsIn: testCase lastResult ]
]

{ #category : #testing }
MTRedTestFilter >> unwantedFailuresOrErrorsIn: results [
	"It is not a problem if there are unwanted failures or errors because they will be filtered out anyway"

	^ false
]
