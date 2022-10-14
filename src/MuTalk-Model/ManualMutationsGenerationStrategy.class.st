Class {
	#name : #ManualMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#instVars : [
		'targetMethods'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
ManualMutationsGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : #accessing }
ManualMutationsGenerationStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
