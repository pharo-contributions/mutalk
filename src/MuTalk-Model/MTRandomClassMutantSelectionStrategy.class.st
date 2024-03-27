Class {
	#name : #MTRandomClassMutantSelectionStrategy,
	#superclass : #MTRandomGroupedMutantSelectionStrategy,
	#category : 'MuTalk-Model-Mutant selection strategies'
}

{ #category : #enumerating }
MTRandomClassMutantSelectionStrategy >> groupCondition [

	^ #originalClass
]
