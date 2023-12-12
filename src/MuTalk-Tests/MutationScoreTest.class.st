Class {
	#name : 'MutationScoreTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MutationScoreTest >> mutationResultAcceptable [
	^MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForKilledMutantByError)
]

{ #category : 'accessing' }
MutationScoreTest >> mutationResultAlmostAcceptable [
	^MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForKilledMutantByError with: resource evaluationResultForAliveMutant)
]

{ #category : 'accessing' }
MutationScoreTest >> mutationResultNonAcceptable [
	^MutationTestingGeneralResult 
		for: (OrderedCollection with: resource evaluationResultForAliveMutant)
]

{ #category : 'testing' }
MutationScoreTest >> setUp [
	resource := MutationTestingResource current
]

{ #category : 'testing' }
MutationScoreTest >> testMutationScoreAcceptable [
	|score|
	score := (MutationAcceptableScore scoreFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MutationScoreTest >> testMutationScoreAlmostAcceptable [
	|score|
	score := (MutationAlmostAcceptableScore scoreFor: self mutationResultAlmostAcceptable).
	self deny: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self assert: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MutationScoreTest >> testMutationScoreColor [
	|score|
	score := (MutationScoreBehavior buildFor: self mutationResultAcceptable).
	self assert: score color = Color green.
	
	score := (MutationScoreBehavior buildFor: self mutationResultNonAcceptable).
	self assert: score color = Color red.
	
	score := (MutationScoreBehavior buildFor: self mutationResultAlmostAcceptable).
	self assert: score color = Color yellow.
]

{ #category : 'testing' }
MutationScoreTest >> testMutationScoreCreation [
	|score|
	score := (MutationScoreBehavior buildFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	score := (MutationScoreBehavior buildFor: self mutationResultAlmostAcceptable).
	self assert: score isAlmostAcceptableScore.
	score := (MutationScoreBehavior buildFor: self mutationResultNonAcceptable).
	self assert: score isNonAcceptableScore.
]

{ #category : 'testing' }
MutationScoreTest >> testMutationScoreNonAcceptable [
	|score|
	score := (MutationNonAcceptableScore scoreFor: self mutationResultNonAcceptable).
	self deny: score isAcceptableScore.
	self assert: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]
