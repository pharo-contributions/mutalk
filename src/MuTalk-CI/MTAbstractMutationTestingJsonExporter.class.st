Class {
	#name : 'MTAbstractMutationTestingJsonExporter',
	#superclass : 'Object',
	#instVars : [
		'mtResult'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'as yet unclassified' }
MTAbstractMutationTestingJsonExporter >> export [

	self subclassResponsibility 
]

{ #category : 'accessing' }
MTAbstractMutationTestingJsonExporter >> mtResult [

	^ mtResult
]

{ #category : 'accessing' }
MTAbstractMutationTestingJsonExporter >> mtResult: anObject [

	mtResult := anObject
]
