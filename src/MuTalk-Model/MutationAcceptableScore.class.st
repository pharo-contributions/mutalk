Class {
	#name : 'MutationAcceptableScore',
	#superclass : 'MutationScoreBehavior',
	#category : 'MuTalk-Model-Score',
	#package : 'MuTalk-Model',
	#tag : 'Score'
}

{ #category : 'instance creation' }
MutationAcceptableScore class >> canHandle: aMutationTestingGeneralResult [ 
	^aMutationTestingGeneralResult mutationScore > 80
]

{ #category : 'accessing' }
MutationAcceptableScore >> color [
	 ^ Color green 
]

{ #category : 'testing' }
MutationAcceptableScore >> isAcceptableScore [
	^true
]

{ #category : 'testing' }
MutationAcceptableScore >> isAlmostAcceptableScore [
	^false
]

{ #category : 'testing' }
MutationAcceptableScore >> isNonAcceptableScore [
	^false
]
