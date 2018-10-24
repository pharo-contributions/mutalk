Class {
	#name : #MutationScoreBehavior,
	#superclass : #Object,
	#instVars : [
		'generalResult'
	],
	#category : 'MuTalk-Model-Score'
}

{ #category : #'instance creation' }
MutationScoreBehavior class >> buildFor: aMutationGeneralResult [
	|handler|
	handler := self allSubclasses detect: [:class | class canHandle: aMutationGeneralResult] ifNone: [].
	^handler scoreFor: aMutationGeneralResult
	
]

{ #category : #'instance creation' }
MutationScoreBehavior class >> scoreFor: aMutationGeneralResult [

	^(self new) initializeFor: aMutationGeneralResult; yourself
	
]

{ #category : #accessing }
MutationScoreBehavior >> generalResult [

	^ generalResult
]

{ #category : #initialization }
MutationScoreBehavior >> initializeFor: aMutationGeneralResult [
	generalResult := aMutationGeneralResult.
]
