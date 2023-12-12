Class {
	#name : 'MutationAlmostAcceptableScore',
	#superclass : 'MutationScoreBehavior',
	#category : 'MuTalk-Model-Score',
	#package : 'MuTalk-Model',
	#tag : 'Score'
}

{ #category : 'instance creation' }
MutationAlmostAcceptableScore class >> canHandle: aMutationTestingGeneralResult [
	| score |
	score := aMutationTestingGeneralResult mutationScore.
	^ score between: 50 and: 80
]

{ #category : 'accessing' }
MutationAlmostAcceptableScore >> color [
	^Color yellow
]

{ #category : 'testing' }
MutationAlmostAcceptableScore >> isAcceptableScore [
	^false
]

{ #category : 'testing' }
MutationAlmostAcceptableScore >> isAlmostAcceptableScore [
	^true
]

{ #category : 'testing' }
MutationAlmostAcceptableScore >> isNonAcceptableScore [
	^false
]
