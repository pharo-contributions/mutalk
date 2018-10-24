Class {
	#name : #MutationNonAcceptableScore,
	#superclass : #MutationScoreBehavior,
	#category : 'MuTalk-Model-Score'
}

{ #category : #'instance creation' }
MutationNonAcceptableScore class >> canHandle: aMutationTestingGeneralResult [ 
	^aMutationTestingGeneralResult mutationScore < 50
]

{ #category : #accessing }
MutationNonAcceptableScore >> color [
	^Color red
]

{ #category : #testing }
MutationNonAcceptableScore >> isAcceptableScore [
	^false
]

{ #category : #testing }
MutationNonAcceptableScore >> isAlmostAcceptableScore [
	^false
]

{ #category : #testing }
MutationNonAcceptableScore >> isNonAcceptableScore [
	^true
]
