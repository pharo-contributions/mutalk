"
This test filter is a composition of multiple test filters.
It works as if the test collection passes through each test filter one by one. So a test is blocked by the composite test filter if any of its filters blocks the said test. In the same way, a test passes through the composite test filter if it passes through every of its filters.
"
Class {
	#name : 'MTCompositeTestFilter',
	#superclass : 'MTTestFilter',
	#instVars : [
		'filters'
	],
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'instance creation' }
MTCompositeTestFilter class >> for: aTestFilterCollection [

	^ self new
		  filters: aTestFilterCollection;
		  yourself
]

{ #category : 'enumerating' }
MTCompositeTestFilter >> excludedTestsFrom: aTestCaseCollection [

	| excludedTestsCollection |
	excludedTestsCollection := Dictionary new.
	filters do: [ :filter |
		excludedTestsCollection addAll:
			((filter excludedTestsFrom: aTestCaseCollection) collect: [ :test |
				 test -> filter filteredTestReason ]) ].
	^ excludedTestsCollection asOrderedCollection
]

{ #category : 'enumerating' }
MTCompositeTestFilter >> filterTests: aTestCaseCollection [

	excludedTests := self excludedTestsFrom: aTestCaseCollection.
	^ filteredTests := self filteredTestsFrom: aTestCaseCollection
]

{ #category : 'enumerating' }
MTCompositeTestFilter >> filteredTestsFrom: aTestCaseCollection [

	| testCaseCollection |
	^ filters inject: aTestCaseCollection into: [ :accumulator :filter |
		  testCaseCollection := filter filteredTestsFrom: accumulator ]
]

{ #category : 'accessing' }
MTCompositeTestFilter >> filters [

	^ filters
]

{ #category : 'accessing' }
MTCompositeTestFilter >> filters: anObject [

	filters := anObject
]
