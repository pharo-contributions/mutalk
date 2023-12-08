Class {
	#name : 'AllMutantSelectionStrategy',
	#superclass : 'MutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutations generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutations generation strategies'
}

{ #category : 'generating' }
AllMutantSelectionStrategy >> classesAndMetaclassesFrom: modelClasses [ 
	^ modelClasses
		inject: OrderedCollection new
		into: [:classes :aClass | 
			classes add: aClass;
				 add: aClass class.
			classes]
]

{ #category : 'generating' }
AllMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [ 
	^ (self classesAndMetaclassesFrom: aMutationTestingAnalysis modelClasses)
		inject: OrderedCollection new
		into: [:methods :aClass | 
			methods addAll: aClass methods.
			methods]
]
