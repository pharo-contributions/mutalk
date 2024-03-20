Class {
	#name : 'MTRandomClassMutantSelectionStrategy',
	#superclass : 'MTRandomGroupedMutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'enumerating' }
MTRandomClassMutantSelectionStrategy >> groupCondition [

	^ #originalClass
]
