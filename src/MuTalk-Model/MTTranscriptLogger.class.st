Class {
	#name : #MTTranscriptLogger,
	#superclass : #MTStreamLogger,
	#category : 'MuTalk-Model-Logging'
}

{ #category : #initialization }
MTTranscriptLogger >> initializeStream [

	stream := Transcript
]
