Class {
	#name : 'MTFileLogger',
	#superclass : 'MTStreamLogger',
	#instVars : [
		'fileReference'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'instance creation' }
MTFileLogger class >> toFileNamed: aString [

	^ self basicNew initializeToFileNamed: aString
]

{ #category : 'initialization' }
MTFileLogger >> initializeStream [

	stream := fileReference writeStream
]

{ #category : 'initialize-release' }
MTFileLogger >> initializeToFileNamed: aString [

	fileReference := aString asFileReference.
	self initialize
]
