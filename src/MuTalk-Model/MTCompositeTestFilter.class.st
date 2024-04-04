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

	^ self new filters: aTestFilterCollection
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

{ #category : 'accessing' }
MTCompositeTestFilter >> filteredTestReason [

	^ 'Is rejected by one of the filters'
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
