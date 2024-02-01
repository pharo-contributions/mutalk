Class {
	#name : 'MTReplaceWhileFalseWithWhileTrueMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperator >> newSelector [

	^ #whileTrue:
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperator >> oldSelector [

	^ #whileFalse:
]
