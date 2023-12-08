Class {
	#name : 'MutationTestingGeneralResultReporter',
	#superclass : 'Object',
	#instVars : [
		'mutationGeneralResult',
		'fileReference',
		'packagesNames'
	],
	#category : 'MuTalk-Model-Reporting',
	#package : 'MuTalk-Model',
	#tag : 'Reporting'
}

{ #category : 'instance creation' }
MutationTestingGeneralResultReporter class >> for: aMutationGeneralResut in: aFileReference with: aPackagesNames [
	^self new 
		initializeFor: aMutationGeneralResut in: aFileReference asFileReference with: aPackagesNames;
		yourself
]

{ #category : 'evaluating' }
MutationTestingGeneralResultReporter >> detailedInfo [
	|stream|
	stream := String streamContents: [:str|
		str nextPutAll: mutationGeneralResult printString; cr.
		str nextPutAll: '----------------------------------'; cr.
		str nextPutAll: mutationGeneralResult elapsedTime printString; cr.
		str nextPutAll: '----------------------------------'; cr.
		mutationGeneralResult printDetailedInfoOn: str].
	^stream contents
	
	
]

{ #category : 'initialize-release' }
MutationTestingGeneralResultReporter >> initializeFor: aMutationGeneralResut in: aFileReference with: aPackagesNames [

	mutationGeneralResult := aMutationGeneralResut.
	fileReference := aFileReference.
	packagesNames := aPackagesNames
]

{ #category : 'evaluating' }
MutationTestingGeneralResultReporter >> resumedInfo [
	|stream|
	stream := String streamContents: [:str|
		str nextPutAll: mutationGeneralResult numberOfEvaluatedMutants printString; tab.
		str nextPutAll: mutationGeneralResult numberOfKilledMutants printString; tab.
		str nextPutAll: mutationGeneralResult numberOfAliveMutants printString; tab.
		str nextPutAll: mutationGeneralResult numberOfTerminatedMutants printString; tab.
		str nextPutAll: mutationGeneralResult mutationScore printString; tab.
		str nextPutAll: mutationGeneralResult elapsedTime asMilliSeconds printString; tab.
		packagesNames do: [:packageName | str nextPutAll: packageName printString; tab].
		str cr.
		].
	^stream contents
	
	
]

{ #category : 'evaluating' }
MutationTestingGeneralResultReporter >> value [
	|file|
	
	file := fileReference writeStream.
	file setToEnd; nextPutAll: self resumedInfo; close.
	
	
]
