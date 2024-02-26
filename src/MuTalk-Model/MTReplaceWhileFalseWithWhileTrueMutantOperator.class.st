Class {
	#name : #MTReplaceWhileFalseWithWhileTrueMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceWhileFalseWithWhileTrueMutantOperator >> newSelector [

	^ #whileTrue:
]

{ #category : #accessing }
MTReplaceWhileFalseWithWhileTrueMutantOperator >> oldSelector [

	^ #whileFalse:
]
