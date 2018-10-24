Class {
	#name : #AllMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#category : 'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
AllMutationsGenerationStrategy >> classesAndMetaclassesFrom: modelClasses [ 
	^ modelClasses
		inject: OrderedCollection new
		into: [:classes :aClass | 
			classes add: aClass;
				 add: aClass class.
			classes]
]

{ #category : #generating }
AllMutationsGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [ 
	^ (self classesAndMetaclassesFrom: aMutationTestingAnalysis modelClasses)
		inject: OrderedCollection new
		into: [:methods :aClass | 
			methods addAll: aClass methods.
			methods]
]
