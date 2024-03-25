Class {
	#name : 'MTRandomMethodMutantSelectionStrategy',
	#superclass : 'MTRandomGroupedMutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'enumerating' }
MTRandomMethodMutantSelectionStrategy >> groupCondition [

	^ #originalMethod
]
