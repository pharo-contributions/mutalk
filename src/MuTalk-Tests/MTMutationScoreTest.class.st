Class {
	#name : 'MTMutationScoreTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTMutationScoreTest >> mutationResultAcceptable [
	^MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForKilledMutantByError)
]

{ #category : 'accessing' }
MTMutationScoreTest >> mutationResultAlmostAcceptable [
	^MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForKilledMutantByError with: resource evaluationResultForAliveMutant)
]

{ #category : 'accessing' }
MTMutationScoreTest >> mutationResultNonAcceptable [
	^MutationTestingGeneralResult 
		for: (OrderedCollection with: resource evaluationResultForAliveMutant)
]

{ #category : 'testing' }
MTMutationScoreTest >> setUp [
	resource := MutationTestingResource current
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreAcceptable [
	|score|
	score := (MutationAcceptableScore scoreFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreAlmostAcceptable [
	|score|
	score := (MutationAlmostAcceptableScore scoreFor: self mutationResultAlmostAcceptable).
	self deny: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self assert: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreColor [
	|score|
	score := (MutationScoreBehavior buildFor: self mutationResultAcceptable).
	self assert: score color = Color green.
	
	score := (MutationScoreBehavior buildFor: self mutationResultNonAcceptable).
	self assert: score color = Color red.
	
	score := (MutationScoreBehavior buildFor: self mutationResultAlmostAcceptable).
	self assert: score color = Color yellow.
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreCreation [
	|score|
	score := (MutationScoreBehavior buildFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	score := (MutationScoreBehavior buildFor: self mutationResultAlmostAcceptable).
	self assert: score isAlmostAcceptableScore.
	score := (MutationScoreBehavior buildFor: self mutationResultNonAcceptable).
	self assert: score isNonAcceptableScore.
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreNonAcceptable [
	|score|
	score := (MutationNonAcceptableScore scoreFor: self mutationResultNonAcceptable).
	self deny: score isAcceptableScore.
	self assert: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]
