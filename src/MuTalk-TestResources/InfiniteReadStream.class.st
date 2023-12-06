Class {
	#name : #InfiniteReadStream,
	#superclass : #ReadStream,
	#category : #'MuTalk-TestResources'
}

{ #category : #testing }
InfiniteReadStream >> atEnd [

	^ false
]

{ #category : #accessing }
InfiniteReadStream >> next [

	^ position >= readLimit
		  ifTrue: [ collection at: (position := 1) ]
		  ifFalse: [ collection at: (position := position + 1) ]
]
