Class {
	#name : 'MTAbstractExporter',
	#superclass : 'Object',
	#instVars : [
		'mtResult',
		'pull_request_id',
		'commit',
		'cloneLocation',
		'root'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTAbstractExporter >> cloneLocation [

	^ cloneLocation
]

{ #category : 'accessing' }
MTAbstractExporter >> cloneLocation: anObject [

	cloneLocation := anObject
]

{ #category : 'accessing' }
MTAbstractExporter >> commit [

	^ commit
]

{ #category : 'accessing' }
MTAbstractExporter >> commit: anObject [

	commit := anObject
]

{ #category : 'as yet unclassified' }
MTAbstractExporter >> export [

	self subclassResponsibility 
]

{ #category : 'accessing' }
MTAbstractExporter >> mtResult [

	^ mtResult
]

{ #category : 'accessing' }
MTAbstractExporter >> mtResult: anObject [

	mtResult := anObject
]

{ #category : 'accessing' }
MTAbstractExporter >> pull_request_id [

	^ pull_request_id
]

{ #category : 'accessing' }
MTAbstractExporter >> pull_request_id: anObject [

	pull_request_id := anObject
]

{ #category : 'accessing' }
MTAbstractExporter >> root [

	^ root
]

{ #category : 'accessing' }
MTAbstractExporter >> root: anObject [

	root := anObject
]
