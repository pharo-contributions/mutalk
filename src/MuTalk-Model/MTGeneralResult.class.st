Class {
	#name : #MTGeneralResult,
	#superclass : #Object,
	#instVars : [
		'particularResults',
		'elapsedTime',
		'excludedTests'
	],
	#category : 'MuTalk-Model-Core'
}

{ #category : #'instance creation' }
MTGeneralResult class >> empty [
	^ self for: OrderedCollection new
]

{ #category : #'instance creation' }
MTGeneralResult class >> for: mutantsEvaluationsResults [

	^ self
		  for: mutantsEvaluationsResults
		  timed: Duration new
		  excludedTests: #(  )
]

{ #category : #'instance creation' }
MTGeneralResult class >> for: mutantsEvaluationsResults timed: anElapsedTime [

	^ self
		  for: mutantsEvaluationsResults
		  timed: anElapsedTime
		  excludedTests: #(  )
]

{ #category : #'instance creation' }
MTGeneralResult class >> for: mutantsEvaluationsResults timed: anElapsedTime excludedTests: someTests [

	^ self new
		  initializeFor: mutantsEvaluationsResults
		  timed: anElapsedTime
		  excludedTests: someTests;
		  yourself
]

{ #category : #accessing }
MTGeneralResult >> aliveMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult survived ]
]

{ #category : #testing }
MTGeneralResult >> elapsedTime [
	^ elapsedTime
]

{ #category : #accessing }
MTGeneralResult >> excludedTests [

	^ excludedTests
]

{ #category : #accessing }
MTGeneralResult >> excludedTests: anObject [

	excludedTests := anObject
]

{ #category : #initialize }
MTGeneralResult >> initializeFor: mutantsEvaluationsResults timed: anElapsedTime excludedTests: someTests [

	particularResults := mutantsEvaluationsResults.
	elapsedTime := anElapsedTime.
	excludedTests := someTests
]

{ #category : #testing }
MTGeneralResult >> isAcceptableScore [
	^ self mutationScore > 80
]

{ #category : #testing }
MTGeneralResult >> isNonAcceptableScore [
	^ self mutationScore < 50
]

{ #category : #accessing }
MTGeneralResult >> killedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult killed ]
]

{ #category : #accessing }
MTGeneralResult >> killedOrTerminatedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult killed or: [ evaluationResult terminated ] ]
]

{ #category : #details }
MTGeneralResult >> mutationScore [
	"Returns the mutation Score of this general result. A mutation score is the
	killedOrTerminatedMutants / numberOfEvaluatedMutants"
	self numberOfEvaluatedMutants = 0 ifTrue: [ ^ 0 ].
	^ (self numberOfKilledOrTerminatedMutants * 100 / self numberOfEvaluatedMutants) asInteger
]

{ #category : #details }
MTGeneralResult >> mutationScoreModel [

	^ MTMutationScoreBehavior buildFor: self
]

{ #category : #details }
MTGeneralResult >> numberOfAliveMutants [
	"Returns the number of survived Mutants of this result"
	^ self aliveMutants size
]

{ #category : #details }
MTGeneralResult >> numberOfEvaluatedMutants [
	"Returns the number of Mutants Evaluated"
	^ particularResults size
]

{ #category : #details }
MTGeneralResult >> numberOfKilledMutants [
	"Returns the number of killed Mutants of this result"
	^ self killedMutants size
]

{ #category : #details }
MTGeneralResult >> numberOfKilledOrTerminatedMutants [
	"Returns the number of killed or terminated Mutants of this result"
	^ self killedOrTerminatedMutants size
]

{ #category : #details }
MTGeneralResult >> numberOfTerminatedMutants [
	"Returns the number of Mutants terminated"
	^ self terminatedMutants size
]

{ #category : #accessing }
MTGeneralResult >> particularResults [

	^ particularResults
]

{ #category : #printing }
MTGeneralResult >> printDetailedInfoOn: aStream [ 
	
	(particularResults 
		groupBy:  [:result | result mutant operator]
		having: [:g | true]) 
			keysAndValuesDo: [:key :value | 
				aStream nextPutAll: key description.
				aStream nextPutAll: ' - '.
				aStream nextPutAll: value size printString; cr.
			]
]

{ #category : #printing }
MTGeneralResult >> printOn: aStream [ 
	aStream
		nextPutAll: self numberOfEvaluatedMutants printString;
		nextPutAll: ' mutants, ';
		nextPutAll: self numberOfKilledMutants printString;
		nextPutAll: ' killed, ';
		nextPutAll: self numberOfAliveMutants printString;
		nextPutAll: ' alive, ';
		nextPutAll: self numberOfTerminatedMutants printString;
		nextPutAll: ' terminated. Mutation Score: ';
		nextPutAll: self mutationScore printString;
		nextPutAll: '%.'
]

{ #category : #accessing }
MTGeneralResult >> terminatedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult terminated ]
]
