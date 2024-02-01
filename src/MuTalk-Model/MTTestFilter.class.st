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

{ #category : 'enumerating' }
MTTestFilter >> filterTests: aTestCaseCollection [

	^ self subclassResponsibility
]
