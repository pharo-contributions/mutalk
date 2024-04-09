Class {
	#name : 'MTRandomMutantSelectionStrategy',
	#superclass : 'MTMutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'generating' }
MTRandomMutantSelectionStrategy >> shuffleMutants: aMutantCollection [

	^ aMutantCollection shuffle
]
