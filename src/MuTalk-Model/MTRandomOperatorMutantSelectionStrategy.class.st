Class {
	#name : 'MTRandomOperatorMutantSelectionStrategy',
	#superclass : 'MTRandomGroupedMutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'enumerating' }
MTRandomOperatorMutantSelectionStrategy >> groupCondition [

	^ #operator
]
