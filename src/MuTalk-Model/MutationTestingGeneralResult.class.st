Class {
	#name : 'MutationTestingGeneralResult',
	#superclass : 'Object',
	#instVars : [
		'particularResults',
		'elapsedTime'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MutationTestingGeneralResult class >> empty [
	^ self for: OrderedCollection new
]

{ #category : 'instance creation' }
MutationTestingGeneralResult class >> for: mutantsEvaluationsResults [ 
	^self for: mutantsEvaluationsResults timed: Duration new
]

{ #category : 'instance creation' }
MutationTestingGeneralResult class >> for: mutantsEvaluationsResults timed: anElapsedTime [ 
	^ self new initializeFor: mutantsEvaluationsResults timed: anElapsedTime;
		 yourself
]

{ #category : 'accessing' }
MutationTestingGeneralResult >> aliveMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult survived ]
]

{ #category : 'testing' }
MutationTestingGeneralResult >> elapsedTime [
	^ elapsedTime
]

{ #category : 'initialize' }
MutationTestingGeneralResult >> initializeFor: mutantsEvaluationsResults timed: anElapsedTime [
	particularResults := mutantsEvaluationsResults.
	elapsedTime := anElapsedTime
]

{ #category : 'testing' }
MutationTestingGeneralResult >> isAcceptableScore [
	^ self mutationScore > 80
]

{ #category : 'testing' }
MutationTestingGeneralResult >> isNonAcceptableScore [
	^ self mutationScore < 50
]

{ #category : 'accessing' }
MutationTestingGeneralResult >> killedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult killed ]
]

{ #category : 'accessing' }
MutationTestingGeneralResult >> killedOrTerminatedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult killed or: [ evaluationResult terminated ] ]
]

{ #category : 'details' }
MutationTestingGeneralResult >> mutationScore [
	"Returns the mutation Score of this general result. A mutation score is the
	killedOrTerminatedMutants / numberOfEvaluatedMutants"
	self numberOfEvaluatedMutants = 0 ifTrue: [ ^ 0 ].
	^ (self numberOfKilledOrTerminatedMutants * 100 / self numberOfEvaluatedMutants) asInteger
]

{ #category : 'details' }
MutationTestingGeneralResult >> mutationScoreModel [
	^MutationScoreBehavior buildFor: self
]

{ #category : 'details' }
MutationTestingGeneralResult >> numberOfAliveMutants [
	"Returns the number of survived Mutants of this result"
	^ self aliveMutants size
]

{ #category : 'details' }
MutationTestingGeneralResult >> numberOfEvaluatedMutants [
	"Returns the number of Mutants Evaluated"
	^ particularResults size
]

{ #category : 'details' }
MutationTestingGeneralResult >> numberOfKilledMutants [
	"Returns the number of killed Mutants of this result"
	^ self killedMutants size
]

{ #category : 'details' }
MutationTestingGeneralResult >> numberOfKilledOrTerminatedMutants [
	"Returns the number of killed or terminated Mutants of this result"
	^ self killedOrTerminatedMutants size
]

{ #category : 'details' }
MutationTestingGeneralResult >> numberOfTerminatedMutants [
	"Returns the number of Mutants terminated"
	^ self terminatedMutants size
]

{ #category : 'printing' }
MutationTestingGeneralResult >> printDetailedInfoOn: aStream [ 
	
	(particularResults 
		groupBy:  [:result | result mutant operator]
		having: [:g | true]) 
			keysAndValuesDo: [:key :value | 
				aStream nextPutAll: key description.
				aStream nextPutAll: ' - '.
				aStream nextPutAll: value size printString; cr.
			]
]

{ #category : 'printing' }
MutationTestingGeneralResult >> printOn: aStream [ 
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

{ #category : 'accessing' }
MutationTestingGeneralResult >> terminatedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult terminated ]
]
