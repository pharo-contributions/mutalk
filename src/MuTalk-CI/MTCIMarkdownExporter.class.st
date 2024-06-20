Class {
	#name : 'MTCIMarkdownExporter',
	#superclass : 'MTAbstractExporter',
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTCIMarkdownExporter >> cloneLocation [

	^ cloneLocation
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> cloneLocation: anObject [

	cloneLocation := anObject
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> export [

	| results alive killed terminated |
	results := mtResult generalResult.
	alive := results numberOfAliveMutants.
	killed := results numberOfKilledMutants.
	terminated := results numberOfTerminatedMutants.
	
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> root [

	^ root
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> root: anObject [

	root := anObject
]
