Class {
	#name : #MTMutationAlmostAcceptableScore,
	#superclass : #MTMutationScoreBehavior,
	#category : 'MuTalk-Model-Score'
}

{ #category : #'instance creation' }
MTMutationAlmostAcceptableScore class >> canHandle: aMutationTestingGeneralResult [
	| score |
	score := aMutationTestingGeneralResult mutationScore.
	^ score between: 50 and: 80
]

{ #category : #accessing }
MTMutationAlmostAcceptableScore >> color [
	^Color yellow
]

{ #category : #testing }
MTMutationAlmostAcceptableScore >> isAcceptableScore [
	^false
]

{ #category : #testing }
MTMutationAlmostAcceptableScore >> isAlmostAcceptableScore [
	^true
]

{ #category : #testing }
MTMutationAlmostAcceptableScore >> isNonAcceptableScore [
	^false
]
