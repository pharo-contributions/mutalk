Class {
	#name : #MTMutationScoreBehavior,
	#superclass : #Object,
	#instVars : [
		'generalResult'
	],
	#category : 'MuTalk-Model-Score'
}

{ #category : #'instance creation' }
MTMutationScoreBehavior class >> buildFor: aMutationGeneralResult [
	|handler|
	handler := self allSubclasses detect: [:class | class canHandle: aMutationGeneralResult] ifNone: [].
	^handler scoreFor: aMutationGeneralResult
	
]

{ #category : #'instance creation' }
MTMutationScoreBehavior class >> scoreFor: aMutationGeneralResult [

	^(self new) initializeFor: aMutationGeneralResult; yourself
	
]

{ #category : #accessing }
MTMutationScoreBehavior >> generalResult [

	^ generalResult
]

{ #category : #initialization }
MTMutationScoreBehavior >> initializeFor: aMutationGeneralResult [
	generalResult := aMutationGeneralResult.
]
