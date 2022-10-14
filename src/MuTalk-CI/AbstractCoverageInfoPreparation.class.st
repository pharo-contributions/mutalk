Class {
	#name : #AbstractCoverageInfoPreparation,
	#superclass : #Object,
	#instVars : [
		'mtResult'
	],
	#category : #'MuTalk-CI'
}

{ #category : #accessing }
AbstractCoverageInfoPreparation >> mtResult [

	^ mtResult
]

{ #category : #accessing }
AbstractCoverageInfoPreparation >> mtResult: anObject [

	mtResult := anObject
]

{ #category : #decoration }
AbstractCoverageInfoPreparation >> prepare [
	self subclassResponsibility 
]
