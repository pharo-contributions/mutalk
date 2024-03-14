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

{ #category : 'instance creation' }
MTPragmaTestFilter class >> for: aPragmaSelector [

	^ self for: aPragmaSelector arguments: #(  )
]

{ #category : 'instance creation' }
MTPragmaTestFilter class >> for: aPragmaSelector arguments: pragmaArguments [

	^ self new
		  condition: aPragmaSelector;
		  pragmaArguments: pragmaArguments;
		  yourself
]

{ #category : 'testing' }
MTPragmaTestFilter class >> isAbstract [

	^ self == MTPragmaTestFilter
]

{ #category : 'accessing' }
MTPragmaTestFilter >> filteredTestReason [

	| reasonString |
	reasonString := self reasonString.

	^ pragmaArguments isEmpty
		  ifTrue: [ reasonString , '>' ]
		  ifFalse: [
			  | pragmaString |
			  pragmaString := pragmaArguments reduce: [ :arg1 :arg2 |
				                  arg1 , ' ' , arg2 ].

			  reasonString , pragmaString , '>' ]
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

{ #category : 'accessing' }
MTPragmaTestFilter >> reasonString [

	self subclassResponsibility
]

{ #category : 'enumerating' }
MTPragmaTestFilter >> rejectPragmaInTestCollection: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCaseReference |
		  self isPragmaValidFrom: testCaseReference ]
]

{ #category : 'enumerating' }
MTPragmaTestFilter >> selectPragmaInTestCollection: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCaseReference |
		  self isPragmaValidFrom: testCaseReference ]
]
