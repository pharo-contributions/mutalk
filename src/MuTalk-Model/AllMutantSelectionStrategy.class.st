Class {
	#name : 'AllMutantSelectionStrategy',
	#superclass : 'MutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
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
