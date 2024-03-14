Class {
	#name : 'MTTestFilter',
	#superclass : 'Object',
	#instVars : [
		'condition',
		'excludedTests',
		'filteredTests'
	],
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'instance creation' }
MTTestFilter class >> for: aCondition [

	^ self new
		  condition: aCondition;
		  yourself
]

{ #category : 'accessing' }
MTTestFilter >> condition [

	^ condition
]

{ #category : 'accessing' }
MTTestFilter >> condition: aCondition [

	condition := aCondition
]

{ #category : 'accessing' }
MTTestFilter >> excludedTests [

	^ excludedTests
]

{ #category : 'accessing' }
MTTestFilter >> excludedTests: anObject [

	excludedTests := anObject
]

{ #category : 'enumerating' }
MTTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ self subclassResponsibility
]

{ #category : 'enumerating' }
MTTestFilter >> filterTests: aTestCaseCollection [

	excludedTests := (self excludedTestsFrom: aTestCaseCollection)
		                 collect: [ :test | test -> self filteredTestReason ].
	^ filteredTests := self filteredTestsFrom: aTestCaseCollection
]

{ #category : 'accessing' }
MTTestFilter >> filteredTestReason [

	self subclassResponsibility
]

{ #category : 'accessing' }
MTTestFilter >> filteredTests [

	^ filteredTests
]

{ #category : 'accessing' }
MTTestFilter >> filteredTests: anObject [

	filteredTests := anObject
]

{ #category : 'enumerating' }
MTTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ self subclassResponsibility
]
