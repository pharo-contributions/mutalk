Class {
	#name : 'MTMutationAcceptableScore',
	#superclass : 'MTMutationScoreBehavior',
	#category : 'MuTalk-Model-Score',
	#package : 'MuTalk-Model',
	#tag : 'Score'
}

{ #category : 'instance creation' }
MTMutationAcceptableScore class >> canHandle: aMutationTestingGeneralResult [ 
	^aMutationTestingGeneralResult mutationScore > 80
]

{ #category : 'accessing' }
MTMutationAcceptableScore >> color [
	 ^ Color green 
]

{ #category : 'testing' }
MTMutationAcceptableScore >> isAcceptableScore [
	^true
]

{ #category : 'testing' }
MTMutationAcceptableScore >> isAlmostAcceptableScore [
	^false
]

{ #category : 'testing' }
MTMutationAcceptableScore >> isNonAcceptableScore [
	^false
]
