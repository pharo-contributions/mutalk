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

	^ MTGeneralResult for: (OrderedCollection with:
			   resource evaluationResultForKilledMutantByError)
]

{ #category : 'accessing' }
MTMutationScoreTest >> mutationResultAlmostAcceptable [

	^ MTGeneralResult for: (OrderedCollection
			   with: resource evaluationResultForKilledMutantByError
			   with: resource evaluationResultForAliveMutant)
]

{ #category : 'accessing' }
MTMutationScoreTest >> mutationResultNonAcceptable [

	^ MTGeneralResult for:
		  (OrderedCollection with: resource evaluationResultForAliveMutant)
]

{ #category : 'running' }
MTMutationScoreTest >> setUp [

	super setUp.
	resource := MTResource current
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreAcceptable [
	|score|
	score := (MTMutationAcceptableScore scoreFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreAlmostAcceptable [
	|score|
	score := (MTMutationAlmostAcceptableScore scoreFor: self mutationResultAlmostAcceptable).
	self deny: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self assert: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreColor [

	| score |
	score := MTMutationScoreBehavior buildFor:
		         self mutationResultAcceptable.
	self assert: score color equals: Color green.

	score := MTMutationScoreBehavior buildFor:
		         self mutationResultNonAcceptable.
	self assert: score color equals: Color red.

	score := MTMutationScoreBehavior buildFor:
		         self mutationResultAlmostAcceptable.
	self assert: score color equals: Color yellow
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreCreation [

	| score |
	score := MTMutationScoreBehavior buildFor:
		         self mutationResultAcceptable.
	self assert: score isAcceptableScore.
	score := MTMutationScoreBehavior buildFor:
		         self mutationResultAlmostAcceptable.
	self assert: score isAlmostAcceptableScore.
	score := MTMutationScoreBehavior buildFor:
		         self mutationResultNonAcceptable.
	self assert: score isNonAcceptableScore
]

{ #category : 'testing' }
MTMutationScoreTest >> testMutationScoreNonAcceptable [
	|score|
	score := (MTMutationNonAcceptableScore scoreFor: self mutationResultNonAcceptable).
	self deny: score isAcceptableScore.
	self assert: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]
