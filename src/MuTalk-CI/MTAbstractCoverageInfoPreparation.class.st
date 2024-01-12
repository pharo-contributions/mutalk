Class {
	#name : 'MTAbstractCoverageInfoPreparation',
	#superclass : 'Object',
	#instVars : [
		'mtResult'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTAbstractCoverageInfoPreparation >> mtResult [

	^ mtResult
]

{ #category : 'accessing' }
MTAbstractCoverageInfoPreparation >> mtResult: anObject [

	mtResult := anObject
]

{ #category : 'decoration' }
MTAbstractCoverageInfoPreparation >> prepare [
	self subclassResponsibility 
]
