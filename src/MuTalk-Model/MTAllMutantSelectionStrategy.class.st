Class {
	#name : #MTAllMutantSelectionStrategy,
	#superclass : #MTMutantSelectionStrategy,
	#category : 'MuTalk-Model-Mutant selection strategies'
}

{ #category : #generating }
MTAllMutantSelectionStrategy >> classesAndMetaclassesFrom: modelClasses [ 
	^ modelClasses
		inject: OrderedCollection new
		into: [:classes :aClass | 
			classes add: aClass;
				 add: aClass class.
			classes]
]

{ #category : #generating }
MTAllMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [ 
	^ (self classesAndMetaclassesFrom: aMutationTestingAnalysis modelClasses)
		inject: OrderedCollection new
		into: [:methods :aClass | 
			methods addAll: aClass methods.
			methods]
]
