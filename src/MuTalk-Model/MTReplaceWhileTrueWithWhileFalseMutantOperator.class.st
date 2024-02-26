Class {
	#name : #MTReplaceWhileTrueWithWhileFalseMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceWhileTrueWithWhileFalseMutantOperator >> newSelector [

	^ #whileFalse:
]

{ #category : #accessing }
MTReplaceWhileTrueWithWhileFalseMutantOperator >> oldSelector [

	^ #whileTrue:
]
