Class {
	#name : 'MTPragmaTestFilter',
	#superclass : 'MTTestFilter',
	#instVars : [
		'pragmaArguments'
	],
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'testing' }
MTPragmaTestFilter class >> isAbstract [

	^ true
]

{ #category : 'enumerating' }
MTPragmaTestFilter >> filterTests: aTestCaseCollection [

	^ self subclassResponsibility
]

{ #category : 'testing' }
MTPragmaTestFilter >> isPragmaValidFrom: aTestCaseReference [

	| pragmas |
	pragmas := aTestCaseReference method pragmas.
	^ pragmas anySatisfy: [ :pragma |
		  pragma selector = condition & (pragma arguments = pragmaArguments) ]
]

{ #category : 'accessing' }
MTPragmaTestFilter >> pragmaArguments [

	^ pragmaArguments
]

{ #category : 'accessing' }
MTPragmaTestFilter >> pragmaArguments: anObject [

	pragmaArguments := anObject
]
