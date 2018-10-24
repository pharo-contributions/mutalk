Class {
	#name : #MutationTestingAnalysisFileLogger,
	#superclass : #MutationTestingAnalysisLogger,
	#instVars : [
		'fileStream'
	],
	#category : 'MuTalk-Model-Logging'
}

{ #category : #'instance creation' }
MutationTestingAnalysisFileLogger class >> toFileNamed: aString [
	^self new initializeToFileNamed: aString.
]

{ #category : #'initialize-release' }
MutationTestingAnalysisFileLogger >> initializeToFileNamed: aString [
	fileStream := FileStream forceNewFileNamed: aString.
]

{ #category : #logging }
MutationTestingAnalysisFileLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	self writeLineToFile: 'The analysis is starting...'.
]

{ #category : #logging }
MutationTestingAnalysisFileLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [ 
	self writeLineToFile: 'Generating mutations for '
			, (self methodNameOf: aCompiledMethod) , '  With operator:' , aMutantOperator description
]

{ #category : #logging }
MutationTestingAnalysisFileLogger >> logStartEvaluating: aMethodMutation [
	| logStream |
	logStream := WriteStream on: String new.
	logStream
		nextPutAll: 'Evaluating mutant of method ';
		nextPutAll: (self methodNameOf: aMethodMutation originalMethod);
		nextPutAll: '  With source:'.
	logStream cr.
	logStream nextPutAll: aMethodMutation modifiedSource.
	self writeLineToFile: logStream contents
]

{ #category : #private }
MutationTestingAnalysisFileLogger >> methodNameOf: aCompiledMethod [ 
	^aCompiledMethod methodClass name asString , '>>' , aCompiledMethod selector printString 
]

{ #category : #private }
MutationTestingAnalysisFileLogger >> writeLineToFile: aString [ 
	[fileStream closed
		ifTrue: [fileStream open].
	fileStream setToEnd; nextPutAll: aString; cr]
		ensure: [fileStream close]
]
