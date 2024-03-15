Class {
	#name : #MTAbstractJsonExporter,
	#superclass : #Object,
	#instVars : [
		'mtResult'
	],
	#category : 'MuTalk-CI'
}

{ #category : #'as yet unclassified' }
MTAbstractJsonExporter >> export [

	self subclassResponsibility 
]

{ #category : #accessing }
MTAbstractJsonExporter >> mtResult [

	^ mtResult
]

{ #category : #accessing }
MTAbstractJsonExporter >> mtResult: anObject [

	mtResult := anObject
]
