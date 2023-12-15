Class {
	#name : 'AbstractMutationTestingJsonExporter',
	#superclass : 'Object',
	#instVars : [
		'mtResult'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'as yet unclassified' }
AbstractMutationTestingJsonExporter >> export [

	self subclassResponsibility 
]

{ #category : 'accessing' }
AbstractMutationTestingJsonExporter >> mtResult [

	^ mtResult
]

{ #category : 'accessing' }
AbstractMutationTestingJsonExporter >> mtResult: anObject [

	mtResult := anObject
]
