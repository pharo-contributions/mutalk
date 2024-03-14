Class {
	#name : 'MTTranscriptLogger',
	#superclass : 'MTStreamLogger',
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'initialization' }
MTTranscriptLogger >> initializeStream [

	stream := Transcript
]
