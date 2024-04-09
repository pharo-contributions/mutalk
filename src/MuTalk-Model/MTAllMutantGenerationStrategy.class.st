Class {
	#name : 'MTAllMutantGenerationStrategy',
	#superclass : 'MTMutantGenerationStrategy',
	#category : 'MuTalk-Model-Mutant generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant generation strategies'
}

{ #category : 'generating' }
MTAllMutantGenerationStrategy >> classesAndMetaclassesFrom: modelClasses [ 
	^ modelClasses
		inject: OrderedCollection new
		into: [:classes :aClass | 
			classes add: aClass;
				 add: aClass class.
			classes]
]

{ #category : 'generating' }
MTAllMutantGenerationStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [ 
	^ (self classesAndMetaclassesFrom: aMutationTestingAnalysis modelClasses)
		inject: OrderedCollection new
		into: [:methods :aClass | 
			methods addAll: aClass methods.
			methods]
]
