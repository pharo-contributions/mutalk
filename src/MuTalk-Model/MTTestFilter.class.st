Class {
	#name : 'MTTestFilter',
	#superclass : 'Object',
	#instVars : [
		'condition'
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

{ #category : 'testing' }
MTTestFilter >> failuresOrErrorsIn: result [

	^ result failures isNotEmpty or: [ result unexpectedErrorCount > 0 ]
]

{ #category : 'enumerating' }
MTTestFilter >> filterTests: aTestCaseCollection [

	^ self subclassResponsibility
]

{ #category : 'testing' }
MTTestFilter >> unwantedFailuresOrErrorsIn: results [
	"Checks if the results contain failures or errors while they shouldn't"

	^ results anySatisfy: [ :result | self failuresOrErrorsIn: result ]
]

{ #category : 'checking' }
MTTestFilter >> validateFailuresIn: results [

	(self unwantedFailuresOrErrorsIn: results) ifTrue: [
		MTTestsWithErrorsException signal ]
]
