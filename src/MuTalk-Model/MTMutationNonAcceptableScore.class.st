Class {
	#name : #MTMutationNonAcceptableScore,
	#superclass : #MTMutationScoreBehavior,
	#category : 'MuTalk-Model-Score'
}

{ #category : #'instance creation' }
MTMutationNonAcceptableScore class >> canHandle: aMutationTestingGeneralResult [ 
	^aMutationTestingGeneralResult mutationScore < 50
]

{ #category : #accessing }
MTMutationNonAcceptableScore >> color [
	^Color red
]

{ #category : #testing }
MTMutationNonAcceptableScore >> isAcceptableScore [
	^false
]

{ #category : #testing }
MTMutationNonAcceptableScore >> isAlmostAcceptableScore [
	^false
]

{ #category : #testing }
MTMutationNonAcceptableScore >> isNonAcceptableScore [
	^true
]
