Class {
	#name : 'MTAnalysisFileLogger',
	#superclass : 'MTAnalysisLogger',
	#instVars : [
		'fileStream'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'instance creation' }
MTAnalysisFileLogger class >> toFileNamed: aString [
	^self new initializeToFileNamed: aString.
]

{ #category : 'initialize-release' }
MTAnalysisFileLogger >> initializeToFileNamed: aString [
	fileStream := FileStream forceNewFileNamed: aString.
]

{ #category : 'logging' }
MTAnalysisFileLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	self writeLineToFile: 'The analysis is starting...'.
]

{ #category : 'logging' }
MTAnalysisFileLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [ 
	self writeLineToFile: 'Generating mutations for '
			, (self methodNameOf: aCompiledMethod) , '  With operator:' , aMutantOperator description
]

{ #category : 'logging' }
MTAnalysisFileLogger >> logStartEvaluating: aMethodMutation [
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

{ #category : 'private' }
MTAnalysisFileLogger >> methodNameOf: aCompiledMethod [ 
	^aCompiledMethod methodClass name asString , '>>' , aCompiledMethod selector printString 
]

{ #category : 'private' }
MTAnalysisFileLogger >> writeLineToFile: aString [ 
	[fileStream closed
		ifTrue: [fileStream open].
	fileStream setToEnd; nextPutAll: aString; cr]
		ensure: [fileStream close]
]
